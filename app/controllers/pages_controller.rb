class PagesController < ApplicationController
  def index
    @products = Product.all

    @categories = Category.all
    @subcategories = Subcategory.all

    @selected_category = params[:category]
    @selected_subcategory = params[:subcategory]
    if ((params[:category] == '' || params[:category].nil?) &&
       (params[:subcategory] == '' || params[:subcategory].nil?))
      # @products = Product.search_by_name(params[:search]).page(params[:page]).per(5)
      # line above includes pagination gem and methods
      @products = Product.search_by_name(params[:search]).page(params[:page]).per(6)
    else
      # @products = Product.joins(:category).search_by_name(params[:search])
      #                                     .search_by_type(params[:subcategory])
      #                                     .search_by_status(params[:subcategory])
      #                                     .page(params[:page]).per(3)
      @products = Product.search_by_name(params[:search])
                         .search_by_category(params[:category])
                         .search_by_subcategory(params[:subcategory])
                         .page(params[:page]).per(6)
    end
  end

  def details
    @product = Product.find(params[:id])
  end

  def alphabetized
    @products = Product.order(:name)
  end

  def products_on_sale
    @products = Product.where(on_sale: :true)
  end

  def products_new
    @products = Product.where(on_sale: :false)
  end

  # define more searches:

  # then by men and women's clothing
  # def men
  #   @men = Product.where(subcategory: :men)
  # end

  # def women
  #   @women = Product.where(subcategory: :women)
  # end

  # links for every letter from A-Z

  # then by each category
  # def tshirt
  #   @tshirt = Product.where(category: :tshirt)
  # end

  # def bottoms
  #   @bottoms = Product.where(category: :bottoms)
  # end
end

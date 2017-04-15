class PagesController < ApplicationController
  def index
    @products = Product.all
  end

  def alphabetized
    @products = Product.order(:name)
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

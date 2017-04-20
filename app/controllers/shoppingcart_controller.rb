class ShoppingcartController < ApplicationController
  before_filter :find_shoppingcart
  before_action :authenticate_customer!

  # After item is added the page redirected back to shopping cart page
  def add
    @shoppingcart.save if @shoppingcart.new_record?
    session[:shoppingcart_id] = @shoppingcart.id
    product = Product.find(params[:id])
    OrderItem.create! :order => @shoppingcart, :product => product, :price => product.price, :quantity => 1
    @shoppingcart.recalculate_price!(current_customer.id)
    flash[:notice] = "Item added to shoppingcart!"
    @description = 'Description of Charge'
    redirect_to '/shoppingcart'
  end

  # After item is removed the page redirected back to shopping cart page
  def remove
    item = @shoppingcart.order_items.find(params[:id])
    item.destroy
    @shoppingcart.recalculate_price!(current_customer.id)
    flash[:notice] = "Item removed from shoppingcart"
    redirect_to '/shoppingcart'
  end

  def checkout
    amount = (@shoppingcart.total * 100).to_i # $5 in cents

    @customer = Stripe::Customer.create(email:  params[:stripeEmail],
                                       source: params[:stripeToken])

    @charge = Stripe::Charge.create(customer:    @customer.id,
                                    amount:      amount,
                                    description: 'Rails Stripe customer',
                                    currency:    'cad')

    if @charge.paid && @charge.amount == amount
      status = Status.where("name = 'Placed'").first
      @shoppingcart.status_id = status.id
      @shoppingcart.stripe_charge_id = @charge.id
      @shoppingcart.save
    end

    session.delete(:shoppingcart_id)
    flash[:notice] = "Thank you for your purchase! We are starting to process your order for shipping!"
    redirect_to root_path
  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to '/shoppingcart'
  end

  def update
    item = @shoppingcart.order_items.find(params[:id])
    @st = params[:id]
    product_inStore = item.product.quantity
    item.quantity = (params[:order_item][@st]).to_i>product_inStore ? product_inStore : params[:order_item][@st]#added this line here
    item.save
    @shoppingcart.recalculate_price!(current_customer.id)
    flash[:notice] = "Item updated!"
    redirect_to '/shoppingcart'
  end


  protected

  def find_shoppingcart
    @shoppingcart = session[:shoppingcart_id] ? Order.find(session[:shoppingcart_id]) : current_customer.orders.build(:status_id => 2, :pst_total => 0, :gst_total => 0, :hst_total => 0, :sub_total => 0, :total => 0)
  end
end

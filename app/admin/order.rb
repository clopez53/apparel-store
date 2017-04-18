ActiveAdmin.register Order do
  permit_params :status_id,
                :customer_id,
                :pst_total,
                :gst_total,
                :hst_total
  scope :in_progress
  scope :placed
  scope :shipped
  scope :cancelled
  scope :completed
  scope :all, :default => true

  action_item :ship, only: :show do
    link_to 'Ship', ship_admin_order_path(order), method: :put if order.status_id==3
  end

  member_action :ship, method: :put do
    order = Order.find(params[:id])
    orderstatus = Status.where("name = 'Shipped'").first.id
    order.update(status_id: orderstatus)
    #Handles the quantity on hand (Stocks)
    order.order_items.each do |item|
      product = item.product
      product.quantity -= item.quantity
      product.save
    end
    redirect_to admin_order_path(order)
  end
end

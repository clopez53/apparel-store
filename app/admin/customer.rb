ActiveAdmin.register Customer do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end
  permit_params :first_name,
                :last_name,
                :phone,
                :address,
                :city,
                :country,
                :postal_code,
                :email,
                :notes,
                :province_id



  show :title => :email do
    panel "Order History" do
      table_for(customer.orders) do
        column("Order", :sortable => :id) {|order| link_to "##{order.id}", admin_order_path(order) }
        column("State")                   {|order| status_tag(Status.find(order.status_id.nil? ? 2 : order.status_id).name) }
        column("Date", :sortable => :created_at){|order| pretty_format(order.created_at) }
        column("Total")                   {|order| number_to_currency order.total }
      end
    end
  end #end show

  sidebar "Customer Details", :only => :show do
    attributes_table_for customer, :email, :first_name, :last_name, :city, :address, :postal_code, :province_id, :created_at
  end

  sidebar "Order History", :only => :show do
    attributes_table_for customer do
      row("Total Orders") { customer.orders.all.count }
      row("Total Value") { number_to_currency customer.orders.all.sum(:total) }
    end
  end
end

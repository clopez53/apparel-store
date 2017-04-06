ActiveAdmin.register OrderItem do
  permit_params :quantity,
                :price,
                :description,
                :product_id,
                :order_id
end

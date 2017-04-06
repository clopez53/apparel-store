ActiveAdmin.register Product do
  permit_params :name,
                :description,
                :price,
                :quantity,
                :image,
                :subcategory_id,
                :on_sale
end

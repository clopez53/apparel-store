ActiveAdmin.register Product do
  permit_params :name,
                :description,
                :price,
                :quantity,
                :image,
                :on_sale,
                :category_id,
                :subcategory_id
end

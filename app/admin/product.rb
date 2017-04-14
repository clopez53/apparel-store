ActiveAdmin.register Product do
  permit_params :name,
                :description,
                :price,
                :quantity,
                :image,   
                :on_sale
end

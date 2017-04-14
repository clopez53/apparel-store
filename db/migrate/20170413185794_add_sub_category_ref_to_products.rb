class AddSubCategoryRefToProducts < ActiveRecord::Migration[5.0]
  def change
    remove_column :products, :references
  end
end

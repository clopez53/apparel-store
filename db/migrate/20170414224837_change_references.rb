class ChangeReferences < ActiveRecord::Migration[5.0]
  def change
    # remove_column :subcategories, :category_id
    # add_reference :products, :subcategory, foreign_key: true
    remove_reference :subcategories, :category, foreign_key: true
    remove_reference :subcategories, :categories, foreign_key: true
    remove_reference :categories, :subcategories, foreign_key: true
    remove_reference :categories, :subcategory, foreign_key: true
  end
end

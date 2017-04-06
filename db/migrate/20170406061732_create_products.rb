class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.decimal :price
      t.integer :quantity
      t.string :image
      t.boolean :on_sale

      t.timestamps
    end
  end
end

class AddStripe < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :stripe_charge_id, :integer
  end
end

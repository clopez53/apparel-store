class FixColumnName < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :sub_total, :decimal
    rename_column :orders, :pst_rate, :pst_total
    rename_column :orders, :gst_rate, :gst_total
    rename_column :orders, :hst_rate, :hst_total
    add_column :orders, :total, :decimal
  end
end

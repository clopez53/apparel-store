class Order < ApplicationRecord
  validates :status,
            :customer,
            presence: true

  validates :pst_rate,
            :gst_rate,
            :hst_rate,
            presence: true, numericality: { greater_than_or_equal_to: 0.00 }

  belongs_to :customer
  belongs_to :status
  has_many :order_items
end

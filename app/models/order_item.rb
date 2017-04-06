class OrderItem < ApplicationRecord
  validates :product,
            :order,
            presence: true

  validates :price,
            presence: true,
            numericality: { greater_than_or_equal_to: 0.00 }

  validates :quantity,
            presence: true,
            numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  belongs_to :product
  belongs_to :order
end

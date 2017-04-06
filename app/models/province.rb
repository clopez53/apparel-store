class Province < ApplicationRecord
  validates :name,
            presence: true

  validates :pst,
            :gst,
            :hst,
            presence: true, numericality: { greater_than_or_equal_to: 0.00 }

  has_many :customers
end

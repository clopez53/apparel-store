class Product < ApplicationRecord
  validates :name,
            :description,
            :subcategory,
            presence: true

  validates :price,
            presence: true,
            numericality: { greater_than_or_equal_to: 0.00 }

  validates :quantity,
            presence: true,
            numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  # mount_uploader :file_name, MediaUploader

  belongs_to :subcategory
  has_many :order_items
end

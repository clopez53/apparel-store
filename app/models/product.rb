class Product < ApplicationRecord
  validates :name,
            :description,
            :subcategory,
            :category,
            presence: true

  validates :price,
            presence: true,
            numericality: { greater_than_or_equal_to: 0.00 }

  validates :quantity,
            presence: true,
            numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  mount_uploader :image, AvatarUploader

  belongs_to :subcategory
  belongs_to :category
  has_many :order_items
end

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

  # scope :search_by_category, lambda { |query| where(['category_id LIKE ?', "%#{query}%"]) }
  # scope :search_by_subcategory, lambda { |query| where(['subcategory_id LIKE ?', "%#{query}%"]) }
  scope :search_by_category, lambda { |query| where(['category_id LIKE ?', "%#{query}%"]) }
  scope :search_by_subcategory, lambda { |query| where(['subcategory_id LIKE ?', "%#{query}%"]) }

  scope :search_by_name, lambda {|query|where(['"products"."name" LIKE ?', "%#{query}%"])}
  # scope :search_by_name, lambda {|query|where(['"products"."description" LIKE ?', "%#{query}%"])}
end

class Subcategory < ApplicationRecord
  validates :name,
            :category,
            presence: true

  belongs_to :category
  has_many :products
end

class Customer < ApplicationRecord
  validates :first_name,    presence: true
  validates :last_name,     presence: true
  validates :phone,         presence: true
  validates :address,       presence: true
  validates :email,         presence: true

  belongs_to :province
end

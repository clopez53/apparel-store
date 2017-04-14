class Customer < ApplicationRecord
  validates :first_name,
            :last_name,
            :phone,
            :address,
            :city,
            :email,
            presence: true

  # validates :postal_code,
  #           presence: true,
  #           zipcode: { country_code: :ca, message: 'Postal code is invalid' }

  belongs_to :province
  has_many :orders

  def full_name
    "#{first_name} #{last_name}"
  end
end

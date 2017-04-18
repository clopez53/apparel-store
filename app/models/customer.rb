class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable, :lockable

  validates :first_name,
            :last_name,
            :phone_number,
            :address,
            :city,
            :email,
            presence: true

  # validates :postal_code,
  #           presence: true,
  #           zipcode: { country_code: :ca, message: 'Postal code is invalid' }

  belongs_to :province
  has_many :orders, :dependent => :destroy

  def full_name
    "#{first_name} #{last_name}"
  end
end

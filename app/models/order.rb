class Order < ApplicationRecord
  validates :status_id,
            :customer,
            presence: true

  validates :pst_total,
            :gst_total,
            :hst_total,
            :sub_total,
            :total,
            presence: true, numericality: { greater_than_or_equal_to: 0.00 }

  belongs_to :customer
  belongs_to :status
  has_many :order_items

  scope :in_progress, -> { where("orders.status_id = 2") }
  scope :placed, -> { where("orders.status_id = 3") }
  scope :shipped, -> { where("orders.status_id = 4") }
  scope :cancelled, -> { where("orders.status_id = 6") }
  scope :completed, -> { where("orders.status_id = 5") }

  def recalculate_price!(id)
    current_customer = Customer.find(id)
    self.pst_total = order_items.inject(0.0){|sum, order_item| sum += order_item.price * order_item.quantity * current_customer.province.pst / 100}
    self.gst_total = order_items.inject(0.0){|sum, order_item| sum += order_item.price * order_item.quantity * current_customer.province.gst / 100}
    self.hst_total = order_items.inject(0.0){|sum, order_item| sum += order_item.price * order_item.quantity * current_customer.province.hst / 100}
    self.sub_total = order_items.inject(0.0){|sum, order_item| sum += order_item.price * order_item.quantity }
    self.total = order_items.inject(0.0){|sum, order_item| sum += order_item.price * order_item.quantity * (1+current_customer.province.pst / 100 + current_customer.province.gst / 100 + current_customer.province.hst / 100)}
    save!
  end

end

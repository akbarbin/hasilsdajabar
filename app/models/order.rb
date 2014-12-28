class Order < ActiveRecord::Base
  # validates :quantity, :presence => true
  ORDER_STATUSES = ["Waiting-approval", "Bergain-approved", "Waiting-order", "Payment-check", "Valid", "Package-sent"]

  attr_accessor :user_type, :quantity_validate, :payment_method_validate
  attr_accessible :grand_total, :order_number, :order_status, :post_id, :price,
    :quantity, :user_id, :payment_method, :user_type, :quantity_validate
  belongs_to :post
  belongs_to :user
  has_one :payment
  has_one :bergain
  before_save :default_order_values, :if => "user_type.blank?"
  before_save :default_buyer_order_values, :if => "user_type.present?"
  before_save :generate_order_number, :if => Proc.new { |order| order.order_status == "Waiting-order" }
  before_save :calculate_grand_total, :if => "quantity.present? && price.present?"
  validates :quantity, :presence => true, numericality: { grather_than_or_equal_to: 0 }
  validate :validate_order_quantity
  validate :validate_method_transfer

  def validate_order_quantity
    if self.quantity_validate.present?
      errors[:quantity] = "tidak mencukupi" if self.quantity > self.post.quantity
    end
  end

  def validate_method_transfer
    if self.payment_method_validate != "transfer"
      errors[:payment_method] = "silahkan dipilih" if self.payment_method.blank?
    end
  end

  def default_order_values
    self.order_status ||= "Waiting-approval"
  end

  def default_buyer_order_values
    self.order_status ||= "Bergain-approved"
  end

  def calculate_grand_total
    self.grand_total = self.price * self.quantity
  end

  def generate_order_number
    order_number = Array.new(8){('a'..'z').to_a[rand(26)]}.join.upcase
    self.order_number = order_number
  end
end
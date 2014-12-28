class Order < ActiveRecord::Base
  attr_accessible :grand_total, :order_number, :order_status, :price, :quantity
  belongs_to :user
  has_one :post
  has_one :bergain
  has_one :payment
end
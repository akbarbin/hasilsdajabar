class Payment < ActiveRecord::Base
  STATUS_PAYMENTS = ["In-progress", "In-checked", "Valid"]
  attr_accessible :bank_transfer_to, :date_payment, :method_payment,
    :name_owner_account, :no_rek, :no_transfer_to, :order_number, :status_payment,
    :amount
  belongs_to :order
  validates :order_number, :presence => true
  validates :date_payment, :presence => true
  validates :no_rek, :presence => true
  validates :name_owner_account, :presence => true
  validates :amount, :presence => true
  before_save :default_payment_values

  def default_payment_values
    self.status_payment ||= "new-payment"
  end

  after_save :update_total_deposit_user, :if => Proc.new { |payment| payment.status_payment == "Valid" }
  after_save :update_quantity_post, :if => Proc.new { |payment| payment.status_payment == "Valid" }
#  after_save :create_new_post_wholeseller, :if => Proc.new { |payment| payment.status_payment == "Valid" }

  # mengubah total deposit user saat payment sudah valid
  def update_total_deposit_user
    return if self.status_payment_was == "Valid"
    order = Order.find_by_order_number(self.order_number)
    return if order.nil?
    order.update_attributes(:order_status => "Valid")
    user = order.post.user
    user.update_attributes(:total_deposit => user.total_deposit.to_i + self.amount)
  end

  # mengubah total deposit user saat payment sudah valid
  def update_quantity_post
    return if self.status_payment_was == "Valid"
    order = Order.find_by_order_number(self.order_number)
    return if order.nil?
    # reduce quantity post seller
    post = order.post
    post.update_attributes(:quantity => post.quantity.to_i - order.quantity)
    return if post.post_id.present?
    # create a post wholeseller
    attributes_old_post = post.attributes.slice!("id", "created_at", "updated_at", "user_id").merge({"quantity" => 1,
        "user_id" => 1, "post_id" => post.id,
        "photo_image" => File.open("#{Rails.root}/public/#{post.photo_image_url}")
      })
    Post.create!(attributes_old_post)
  end
end
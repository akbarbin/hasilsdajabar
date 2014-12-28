class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :email, :name, :status_user, :total_deposit, :type_user, :username,
    :address, :regency

  has_many :posts
  has_many :orders

  validates :name, :presence => true
  validates :type_user, :presence => true

  TYPES_USER = ["Seller", "Wholeseller", "Buyer"]

  def is_seller?
    self.type_user == "Seller"
  end

  def is_wholeseller?
    self.type_user == "Wholeseller"
  end

  def is_buyer?
    self.type_user == "Buyer"
  end

  def is_admin?
    self.type_user == "Admin"
  end
end
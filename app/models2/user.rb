class User < ActiveRecord::Base
  attr_accessible :email, :id, :name, :status_user, :total_deposit,
    :type_user, :username
  has_many :posts
  has_many :orders
end

class Post < ActiveRecord::Base
  attr_accessible :description, :harvest_date, :purchase_price, :quantity,
    :selling_price, :slug, :title, :user_id, :wholeseller_id
  belongs_to :user, :order
end

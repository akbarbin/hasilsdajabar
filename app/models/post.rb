class Post < ActiveRecord::Base
  attr_accessible :description, :harvest_date, :purchase_price, :quantity,
    :selling_price, :slug, :title, :user_id, :wholeseller_id, :photo_image,
    :remove_photo_image, :post_status, :photo_image_cache, :post_id
  mount_uploader :photo_image, PostImageUploader
  validates :title, :presence => true
  validates :description, :presence => true
  validates :harvest_date, :presence => true
  validate :validation_photo_image, if: "photo_image?"
  belongs_to :user
  belongs_to :wholeseller, :class_name => 'User', :foreign_key => :wholeseller_id
  has_many :orders

  def validation_photo_image
    errors[:photo_image] << "should be less than 2 Megabytes" if photo_image.size > 2.megabytes.to_i
  end
end
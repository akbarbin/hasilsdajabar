class AddPhotoImageToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :photo_image, :string
  end
end

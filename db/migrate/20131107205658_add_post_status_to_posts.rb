class AddPostStatusToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :post_status, :string
  end
end

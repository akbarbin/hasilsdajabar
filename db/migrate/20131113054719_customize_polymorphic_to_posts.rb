class CustomizePolymorphicToPosts < ActiveRecord::Migration
  def up
    remove_column :posts, :wholeseller_id
    add_column :posts, :post_id, :integer
  end

  def down
    add_column :posts, :wholeseller_id, :integer
    remove_column :posts, :post_id
  end
end
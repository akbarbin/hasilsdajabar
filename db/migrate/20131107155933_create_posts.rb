class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :description
      t.date :harvest_date
      t.integer :quantity
      t.integer :selling_price
      t.integer :purchase_price
      t.string :slug
      t.integer :user_id
      t.integer :wholesellerid

      t.timestamps
    end
  end
end

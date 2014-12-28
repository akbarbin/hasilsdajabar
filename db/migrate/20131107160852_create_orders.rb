class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :order_number
      t.string :order_status
      t.integer :quantity
      t.integer :price
      t.integer :grand_total
      t.integer :post_id
      t.integer :user_id

      t.timestamps
    end
  end
end

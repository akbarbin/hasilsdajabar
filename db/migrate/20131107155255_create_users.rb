class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :username
      t.string :status_user
      t.string :type_user
      t.integer :total_deposit

      t.timestamps
    end
  end
end

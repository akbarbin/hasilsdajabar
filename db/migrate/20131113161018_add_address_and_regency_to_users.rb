class AddAddressAndRegencyToUsers < ActiveRecord::Migration
  def change
    add_column :users, :address, :text
    add_column :users, :regency, :string
  end
end

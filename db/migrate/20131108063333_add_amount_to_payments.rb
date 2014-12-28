class AddAmountToPayments < ActiveRecord::Migration
  def change
    add_column :payments, :amount, :integer, :default => 0
  end
end

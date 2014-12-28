class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.string :no_rek
      t.date :date_payment
      t.string :order_number
      t.string :no_transfer_to
      t.string :bank_transfer_to
      t.string :status_payment
      t.string :method_payment
      t.string :name_owner_account

      t.timestamps
    end
  end
end

class Payment < ActiveRecord::Base
  attr_accessible :bank_rek, :bank_transfer_to, :method_payment, :nameOwnerAccount,
    :no_rek, :no_tranfer_to, :order_number, :status_payment
  belongs_to :order
end

class Bergain < ActiveRecord::Base
  attr_accessor :post_id
  attr_accessible :bergain_price, :bergain_status, :order_id, :survey_date, :post_id
  belongs_to :order
  validates :survey_date, :presence => true
  before_save :default_order_values

  def default_order_values
    self.bergain_status ||= "Waiting-approval"
  end

  BERGAIN_STATUS = ["Approved", "Rejected"]

  after_save :update_attribute_post, :if => Proc.new { |bergain| bergain.bergain_status == "Approved" }

  # NEXT -> tanggani approved saat lebih dari satu dan boleh dipesansan dan kasih notice
  # kalau product sudah habis akan di batalkan semua.
  # nanti proses update tengkulak saat tengkulak sudah bayar.
  # untuk pengurangan stok saat payment berhasil
  # ketika stok berkurang akan di batalkan atau kirim seadanya.
  # whole seller di tambahkan saat sudah payment.
  def update_attribute_post
    puts "kirim email approved ke tengkulak."
    puts "update status order menjadi approved by seller."
    order = self.order
    post = self.order.post
    order.update_attributes(:order_status => "Bergain-approved")
    post.update_attributes(:purchase_price => self.bergain_price)
  end
end
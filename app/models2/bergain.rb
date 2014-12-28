class Bergain < ActiveRecord::Base
  attr_accessible :bergainPrice, :bergain_status, :order_id, :survey_date
  belongs_to :order
end

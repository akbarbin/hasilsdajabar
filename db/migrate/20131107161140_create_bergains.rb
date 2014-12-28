class CreateBergains < ActiveRecord::Migration
  def change
    create_table :bergains do |t|
      t.date :survey_date
      t.string :bergain_status
      t.integer :bergain_price
      t.integer :order_id

      t.timestamps
    end
  end
end

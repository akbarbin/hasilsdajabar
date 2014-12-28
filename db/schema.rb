# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20131113161018) do

  create_table "bergains", :force => true do |t|
    t.date     "survey_date"
    t.string   "bergain_status"
    t.integer  "bergain_price"
    t.integer  "order_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "orders", :force => true do |t|
    t.string   "order_number"
    t.string   "order_status"
    t.integer  "quantity"
    t.integer  "price"
    t.integer  "grand_total"
    t.integer  "post_id"
    t.integer  "user_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.string   "payment_method"
  end

  create_table "payments", :force => true do |t|
    t.string   "no_rek"
    t.date     "date_payment"
    t.string   "order_number"
    t.string   "no_transfer_to"
    t.string   "bank_transfer_to"
    t.string   "status_payment"
    t.string   "method_payment"
    t.string   "name_owner_account"
    t.datetime "created_at",                        :null => false
    t.datetime "updated_at",                        :null => false
    t.integer  "amount",             :default => 0
  end

  create_table "posts", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.date     "harvest_date"
    t.integer  "quantity"
    t.integer  "selling_price"
    t.integer  "purchase_price"
    t.string   "slug"
    t.integer  "user_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.string   "photo_image"
    t.string   "post_status"
    t.integer  "post_id"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "username"
    t.string   "status_user"
    t.string   "type_user"
    t.integer  "total_deposit"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0,  :null => false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.text     "address"
    t.string   "regency"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end

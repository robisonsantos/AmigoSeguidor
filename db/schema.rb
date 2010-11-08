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

ActiveRecord::Schema.define(:version => 20101107203743) do

  create_table "groups", :force => true do |t|
    t.string   "name",                                       :null => false
    t.float    "gift_price",                                 :null => false
    t.datetime "revelation_day",                             :null => false
    t.string   "revelation_address"
    t.string   "revelation_address_link"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "description"
    t.boolean  "private",                 :default => false
    t.string   "token"
  end

  create_table "memberships", :force => true do |t|
    t.integer  "user_id",                              :null => false
    t.integer  "group_id",                             :null => false
    t.boolean  "adm",               :default => false, :null => false
    t.boolean  "owner",             :default => false, :null => false
    t.integer  "membership_status", :default => 0,     :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "friend"
  end

# Could not dump table "messages" because of following StandardError
#   Unknown type 'reference' for column 'sender'

  create_table "privatecodes", :force => true do |t|
    t.integer  "group_id",   :null => false
    t.string   "code",       :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                               :default => "", :null => false
    t.string   "encrypted_password",   :limit => 128, :default => "", :null => false
    t.string   "password_salt",                       :default => "", :null => false
    t.string   "reset_password_token"
    t.string   "remember_token"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                       :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "name",                                                :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "wishitems", :force => true do |t|
    t.integer  "wishlist_id"
    t.string   "name"
    t.text     "description"
    t.string   "url"
    t.string   "category"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "wishlists", :force => true do |t|
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end

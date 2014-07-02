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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20140702134220) do

  create_table "apartments", force: true do |t|
    t.string  "name"
    t.string  "street_address"
    t.boolean "occupied"
    t.string  "country"
    t.integer "zipcode"
    t.integer "user_id"
  end

  create_table "circles", force: true do |t|
    t.string  "city"
    t.string  "state"
    t.integer "zipcode"
  end

  create_table "memberships", force: true do |t|
    t.string  "user_id"
    t.integer "circle_id"
    t.boolean "received"
    t.boolean "approved"
  end

  create_table "messages", force: true do |t|
    t.text    "body"
    t.integer "sender_id"
    t.integer "receiver_id"
    t.boolean "received"
  end

  create_table "tasks", force: true do |t|
    t.integer "apartment_id"
    t.string  "title"
    t.text    "description"
    t.boolean "completed"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "name"
    t.text     "about"
    t.boolean  "landlord"
    t.integer  "age"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end

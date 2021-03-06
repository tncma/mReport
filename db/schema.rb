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

ActiveRecord::Schema.define(version: 20131215030136) do

  create_table "admins", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
  end

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true, using: :btree
  add_index "admins", ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true, using: :btree

  create_table "staffs", force: true do |t|
    t.string   "name"
    t.string   "phone"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "swm_vehicles", force: true do |t|
    t.string   "name"
    t.integer  "pushcart_primary"
    t.integer  "tricycles_primary"
    t.integer  "auto_primary"
    t.integer  "minilorry_primary"
    t.integer  "tractor_primary"
    t.integer  "lorry_secondary"
    t.integer  "compactor_secondary"
    t.integer  "dumper_secondary"
    t.decimal  "available_acre",      precision: 10, scale: 0
    t.decimal  "land_for_compost",    precision: 10, scale: 0
    t.decimal  "balance_req",         precision: 10, scale: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tickets", force: true do |t|
    t.string   "description"
    t.string   "subject"
    t.string   "category"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
    t.integer  "resolved"
    t.string   "location"
  end

  create_table "users", force: true do |t|
    t.string   "phone"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "wards", force: true do |t|
    t.string   "name"
    t.integer  "no_of_wards"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end

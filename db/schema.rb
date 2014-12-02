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

ActiveRecord::Schema.define(version: 20141130184513) do

  create_table "businesses", force: true do |t|
    t.string   "name"
    t.decimal  "lat",        precision: 10, scale: 6
    t.decimal  "lng",        precision: 10, scale: 6
    t.string   "address"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "yelp_id"
  end

  create_table "complaints", force: true do |t|
    t.string   "product"
    t.string   "sub_product"
    t.string   "issue"
    t.string   "sub_issue"
    t.string   "state"
    t.integer  "zipcode"
    t.string   "date_submitted"
    t.string   "company"
    t.string   "consumer_disputed"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "business_id"
  end

  add_index "complaints", ["business_id"], name: "index_complaints_on_business_id"

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "username"
    t.string   "password_hash"
    t.string   "password_salt"
    t.string   "role",          default: "user"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "provider"
    t.string   "uid"
  end

end

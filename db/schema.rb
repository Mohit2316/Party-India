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

ActiveRecord::Schema.define(version: 20150225011545) do

  create_table "businessowners", force: :cascade do |t|
    t.string   "company_name"
    t.string   "email"
    t.string   "password"
    t.string   "company_website"
    t.string   "phone"
    t.integer  "event_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "role"
  end

  add_index "businessowners", ["email"], name: "index_businessowners_on_email", unique: true
  add_index "businessowners", ["event_id"], name: "index_businessowners_on_event_id"

  create_table "events", force: :cascade do |t|
    t.string   "name"
    t.string   "event_type"
    t.string   "organizer"
    t.datetime "start_time"
    t.datetime "end_time"
    t.string   "picture_url"
    t.string   "description"
    t.string   "street_address"
    t.string   "city"
    t.string   "country"
    t.string   "zip"
    t.decimal  "latitude"
    t.decimal  "longitude"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "source"
    t.string   "club_url"
    t.integer  "businessowner_id"
    t.string   "approved"
    t.boolean  "is_approved"
  end

  add_index "events", ["businessowner_id"], name: "index_events_on_businessowner_id"

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "picture_url"
    t.string   "email"
    t.string   "password"
    t.string   "phone"
    t.date     "dob"
    t.integer  "event_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["event_id"], name: "index_users_on_event_id"

end

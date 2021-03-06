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

ActiveRecord::Schema.define(version: 20160406012534) do

  create_table "chats", force: :cascade do |t|
    t.integer  "weef_id",    limit: 4
    t.integer  "user_id",    limit: 4
    t.string   "text",       limit: 255
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.boolean  "served",                 default: false
  end

  create_table "emotions", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "posts", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.string   "text",       limit: 255
    t.integer  "emotion_id", limit: 4
    t.float    "latitude",   limit: 24
    t.float    "longitude",  limit: 24
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "",   null: false
    t.string   "encrypted_password",     limit: 255, default: "",   null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,    null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.string   "name",                   limit: 255
    t.float    "latitude",               limit: 24,  default: 0.0
    t.float    "longitude",              limit: 24,  default: 0.0
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
    t.integer  "location_radius",        limit: 4,   default: 2000
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "weactions", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.integer  "post_id",    limit: 4
    t.integer  "emotion_id", limit: 4
    t.boolean  "match",                default: false
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.boolean  "active",               default: true
  end

  create_table "weefs", force: :cascade do |t|
    t.integer  "weaction_a_id", limit: 4
    t.integer  "weaction_b_id", limit: 4
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.boolean  "active",                  default: true
  end

end

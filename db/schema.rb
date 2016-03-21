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

ActiveRecord::Schema.define(version: 20160321012200) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "achievements", force: :cascade do |t|
    t.integer  "user_achievement_id"
    t.integer  "user_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "bids", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean  "correct"
    t.integer  "event_id"
    t.integer  "choice_id"
  end

  add_index "bids", ["event_id"], name: "index_bids_on_event_id", using: :btree
  add_index "bids", ["user_id"], name: "index_bids_on_user_id", using: :btree

  create_table "events", force: :cascade do |t|
    t.text     "title"
    t.datetime "time"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean  "active"
    t.integer  "winner_id"
  end

  add_index "events", ["user_id"], name: "index_events_on_user_id", using: :btree

  create_table "events_teams", force: :cascade do |t|
    t.integer "event_id"
    t.integer "team_id"
  end

  add_index "events_teams", ["event_id"], name: "index_events_teams_on_event_id", using: :btree
  add_index "events_teams", ["team_id"], name: "index_events_teams_on_team_id", using: :btree

  create_table "matches", force: :cascade do |t|
    t.string   "uid"
    t.string   "winner"
    t.datetime "started_at"
    t.string   "mode"
    t.string   "match_type"
    t.string   "duration"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "results", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "event_id"
    t.integer  "bid_id"
    t.boolean  "correct"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "results", ["user_id"], name: "index_results_on_user_id", using: :btree

  create_table "shields", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "event_id"
    t.integer  "bid_id"
    t.string   "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "teams", force: :cascade do |t|
    t.text "title"
  end

  create_table "user_achievements", force: :cascade do |t|
    t.string   "name"
    t.integer  "quantity_condition"
    t.string   "type_condition"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "user_counters", force: :cascade do |t|
    t.integer "spree",      default: 0
    t.integer "wins",       default: 0
    t.integer "losses",     default: 0
    t.integer "total_bids", default: 0
    t.integer "user_id"
  end

  add_index "user_counters", ["user_id"], name: "index_user_counters_on_user_id", unique: true, using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "name"
    t.integer  "role"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "bids", "events"
  add_foreign_key "bids", "users"
  add_foreign_key "events", "users"
end

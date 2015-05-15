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

ActiveRecord::Schema.define(version: 20150224151128) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "hstore"

  create_table "attributable_activities", force: :cascade do |t|
    t.string   "action"
    t.string   "notes"
    t.integer  "user_id"
    t.integer  "ownable_id"
    t.string   "ownable_type"
    t.integer  "trackable_id"
    t.string   "trackable_type"
    t.hstore   "change_hash"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "attributable_activities", ["action"], name: "index_attributable_activities_on_action", using: :btree
  add_index "attributable_activities", ["change_hash"], name: "change_hash_idx", using: :gist
  add_index "attributable_activities", ["ownable_id"], name: "index_attributable_activities_on_ownable_id", using: :btree
  add_index "attributable_activities", ["ownable_type"], name: "index_attributable_activities_on_ownable_type", using: :btree
  add_index "attributable_activities", ["trackable_id"], name: "index_attributable_activities_on_trackable_id", using: :btree
  add_index "attributable_activities", ["trackable_type"], name: "index_attributable_activities_on_trackable_type", using: :btree
  add_index "attributable_activities", ["user_id"], name: "index_attributable_activities_on_user_id", using: :btree

end

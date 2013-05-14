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

ActiveRecord::Schema.define(:version => 20130509201705) do

  create_table "attributable_activities", :force => true do |t|
    t.string   "action"
    t.string   "notes"
    t.integer  "user_id"
    t.integer  "ownable_id"
    t.string   "ownable_type"
    t.integer  "trackable_id"
    t.string   "trackable_type"
    t.hstore   "change_hash"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "attributable_activities", ["action"], :name => "index_attributable_activities_on_action"
  add_index "attributable_activities", ["change_hash"], :name => "change_hash_idx"
  add_index "attributable_activities", ["ownable_id"], :name => "index_attributable_activities_on_ownable_id"
  add_index "attributable_activities", ["ownable_type"], :name => "index_attributable_activities_on_ownable_type"
  add_index "attributable_activities", ["trackable_id"], :name => "index_attributable_activities_on_trackable_id"
  add_index "attributable_activities", ["trackable_type"], :name => "index_attributable_activities_on_trackable_type"
  add_index "attributable_activities", ["user_id"], :name => "index_attributable_activities_on_user_id"

end

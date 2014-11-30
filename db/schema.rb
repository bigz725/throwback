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

ActiveRecord::Schema.define(:version => 20141130222810) do

  create_table "batters", :primary_key => "batter_id", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "stance",     :limit => 1
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
  end

  create_table "games", :primary_key => "game_id", :force => true do |t|
    t.date     "game_date"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "pitch_types", :primary_key => "code", :force => true do |t|
    t.boolean  "strike"
    t.boolean  "swinging"
    t.boolean  "contact"
    t.boolean  "in_play"
    t.boolean  "bunt"
    t.boolean  "foul"
    t.boolean  "pitchout"
    t.boolean  "automatic"
    t.boolean  "tip"
    t.boolean  "blocked"
    t.boolean  "intentional"
    t.boolean  "hit_by_pitch"
    t.boolean  "interference"
    t.boolean  "out"
    t.boolean  "run"
    t.string   "description"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "pitchers", :primary_key => "pitcher_id", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "throws",     :limit => 1
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
  end

  create_table "pitches", :force => true do |t|
    t.string   "game_id"
    t.string   "pitcher_id"
    t.integer  "inning"
    t.boolean  "top_of_inning"
    t.integer  "game_atbat_number"
    t.integer  "pitch_per_atbat"
    t.integer  "pitch_per_game"
    t.string   "batter_id"
    t.string   "batter_stance",            :limit => 1
    t.float    "strike_zone_top"
    t.float    "strike_zone_bottom"
    t.string   "pitch_result",             :limit => 20
    t.text     "event_description"
    t.string   "pitch_type",               :limit => 2
    t.float    "pitch_initial_speed"
    t.float    "pitch_speed_at_homeplate"
    t.float    "pitch_deflection_break_x"
    t.float    "pitch_deflection_break_z"
    t.float    "pitch_plate_location_x"
    t.float    "pitch_plate_location_z"
    t.float    "pitch_initial_position_x"
    t.float    "pitch_initial_position_z"
    t.float    "command_pitch_location_x"
    t.float    "command_pitch_location_z"
    t.float    "command_mitt_location_x"
    t.float    "command_mitt_location_z"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "pitches", ["batter_id"], :name => "fk_batter_id"
  add_index "pitches", ["game_id"], :name => "fk_game_id"
  add_index "pitches", ["pitch_result"], :name => "fk_pitch_type"
  add_index "pitches", ["pitch_type"], :name => "pitch_type_idx"
  add_index "pitches", ["pitcher_id"], :name => "fk_pitcher_id"

end

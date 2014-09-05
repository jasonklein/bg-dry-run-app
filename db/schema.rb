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

ActiveRecord::Schema.define(:version => 20140905191436) do

  create_table "base_modules", :force => true do |t|
    t.string   "name"
    t.string   "report"
    t.integer  "match_id"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
    t.boolean  "report_run", :default => false
  end

  add_index "base_modules", ["match_id"], :name => "index_base_modules_on_match_id"

  create_table "clips", :force => true do |t|
    t.integer  "match_id"
    t.string   "video"
    t.datetime "created_at",                        :null => false
    t.datetime "updated_at",                        :null => false
    t.integer  "player_id"
    t.boolean  "transcoded",     :default => false
    t.integer  "base_module_id"
  end

  add_index "clips", ["base_module_id"], :name => "index_clips_on_base_module_id"
  add_index "clips", ["player_id"], :name => "index_clips_on_player_id"

  create_table "matches", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "name"
    t.datetime "play_date"
  end

  create_table "players", :force => true do |t|
    t.string   "upi"
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "match_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "players", ["match_id"], :name => "index_players_on_match_id"

  create_table "videos", :force => true do |t|
    t.integer  "match_id"
    t.string   "location"
    t.string   "container"
    t.float    "duration"
    t.datetime "creation_time"
    t.integer  "bitrate"
    t.string   "video_stream"
    t.string   "audio_stream"
    t.string   "video_codec"
    t.string   "audio_channels"
    t.integer  "audio_sample_rate"
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.string   "camera"
  end

  add_index "videos", ["match_id"], :name => "index_videos_on_match_id"

end

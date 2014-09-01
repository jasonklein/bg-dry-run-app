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

ActiveRecord::Schema.define(:version => 20140901142007) do

  create_table "clips", :force => true do |t|
    t.integer  "match_id"
    t.string   "video"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "matches", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "name"
    t.datetime "play_date"
  end

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
    t.string   "camera_name"
  end

  add_index "videos", ["match_id"], :name => "index_videos_on_match_id"

end

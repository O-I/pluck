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

ActiveRecord::Schema.define(version: 20140421185625) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "favorites", force: true do |t|
    t.string   "tweet_id"
    t.datetime "date_tweeted"
    t.text     "text"
    t.string   "tweeter_id"
    t.string   "tweeter_name"
    t.string   "tweeter_screen_name"
    t.text     "tweeter_profile_image_url"
    t.integer  "retweet_count"
    t.integer  "favorite_count"
    t.text     "urls"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "favorites", ["date_tweeted"], name: "index_favorites_on_date_tweeted", using: :btree
  add_index "favorites", ["favorite_count"], name: "index_favorites_on_favorite_count", using: :btree
  add_index "favorites", ["retweet_count"], name: "index_favorites_on_retweet_count", using: :btree
  add_index "favorites", ["tweet_id"], name: "index_favorites_on_tweet_id", unique: true, using: :btree
  add_index "favorites", ["tweeter_name"], name: "index_favorites_on_tweeter_name", using: :btree
  add_index "favorites", ["tweeter_screen_name"], name: "index_favorites_on_tweeter_screen_name", using: :btree

end

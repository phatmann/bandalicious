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

ActiveRecord::Schema.define(:version => 20110916140809) do

  create_table "bands", :force => true do |t|
    t.string   "name"
    t.string   "handle"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "setlist_songs", :force => true do |t|
    t.integer  "position"
    t.integer  "song_id"
    t.integer  "setlist_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "setlist_songs", ["setlist_id"], :name => "index_setlist_songs_on_setlist_id"
  add_index "setlist_songs", ["song_id"], :name => "index_setlist_songs_on_song_id"

  create_table "setlists", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "band_id"
  end

  create_table "shows", :force => true do |t|
    t.string   "name"
    t.date     "date"
    t.integer  "band_id"
    t.integer  "setlist_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "songs", :force => true do |t|
    t.string   "name"
    t.integer  "band_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end

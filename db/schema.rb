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


ActiveRecord::Schema.define(version: 20150309233609) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "board_squares", force: :cascade do |t|
    t.integer  "row"
    t.string   "column"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "boards", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "player1"
    t.integer  "player2"
    t.integer  "player1_id"
    t.integer  "player2_id"
  end

  add_index "boards", ["player1_id"], name: "index_boards_on_player1_id", using: :btree
  add_index "boards", ["player2_id"], name: "index_boards_on_player2_id", using: :btree

  create_table "game_pieces", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.integer  "board_square_id"
    t.boolean  "moved",           default: false
  end

  add_index "game_pieces", ["board_square_id"], name: "index_game_pieces_on_board_square_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "password_digest"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "provider"
    t.string   "uid"
    t.string   "twitter_consumer_token"
    t.string   "twitter_consumer_secret"
    t.text     "omniauth_raw_data"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "token"
    t.datetime "expires_at"
  end

  add_foreign_key "boards", "users", column: "player1"
  add_foreign_key "boards", "users", column: "player2"
end

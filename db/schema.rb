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

ActiveRecord::Schema.define(version: 2019_06_20_142542) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "favorites", force: :cascade do |t|
    t.integer "user_id"
    t.integer "food_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image"
    t.string "categories"
    t.string "youtube_url"
    t.string "area"
    t.string "instructions"
  end

  create_table "foods", force: :cascade do |t|
    t.string "name"
    t.string "image"
    t.string "categories"
    t.integer "rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "api_id"
    t.string "youtube_url"
    t.string "area"
    t.string "instructions"
  end

  create_table "posts", force: :cascade do |t|
    t.integer "user_id"
    t.integer "food_id"
    t.string "text"
    t.integer "likes"
    t.integer "dislikes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username"
    t.string "image_url"
    t.string "profile_image_url"
    t.string "foodName"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "location"
    t.string "username"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "user_picture"
  end

end

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_07_12_040436) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "fish", force: :cascade do |t|
    t.string "species"
    t.float "length"
    t.float "weight"
    t.integer "quantity"
    t.boolean "harvested"
    t.string "photo"
    t.bigint "post_id"
    t.index ["post_id"], name: "index_fish_on_post_id"
  end

  create_table "posts", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.string "city"
    t.string "state"
    t.string "body_of_water"
    t.string "region"
    t.string "privacy"
    t.string "fly_or_conventional"
    t.bigint "user_id"
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "username"
    t.string "city"
    t.string "state"
    t.string "bio"
    t.string "profile_pic"
    t.string "google_token"
    t.string "uid"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "fish", "posts"
  add_foreign_key "posts", "users"
end

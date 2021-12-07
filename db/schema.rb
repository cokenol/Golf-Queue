# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_12_07_024523) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "golf_ranges", force: :cascade do |t|
    t.string "name"
    t.text "address"
    t.string "weather"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.float "latitude"
    t.float "longitude"
    t.string "photo_url"
  end

  create_table "playwall_posts", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.text "caption"
    t.bigint "golf_range_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["golf_range_id"], name: "index_playwall_posts_on_golf_range_id"
    t.index ["user_id"], name: "index_playwall_posts_on_user_id"
  end

  create_table "queue_walls", force: :cascade do |t|
    t.integer "queue_length"
    t.string "level"
    t.bigint "golf_range_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["golf_range_id"], name: "index_queue_walls_on_golf_range_id"
    t.index ["user_id"], name: "index_queue_walls_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "playwall_posts", "golf_ranges"
  add_foreign_key "playwall_posts", "users"
  add_foreign_key "queue_walls", "golf_ranges"
  add_foreign_key "queue_walls", "users"
end

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

ActiveRecord::Schema.define(version: 2020_04_16_202113) do

  create_table "artists", force: :cascade do |t|
    t.string "name"
    t.string "bio"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "artworks", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "object_type_id", null: false
    t.integer "artist_id", null: false
    t.string "title"
    t.string "img_url"
    t.float "price"
    t.boolean "for_sale", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["artist_id"], name: "index_artworks_on_artist_id"
    t.index ["object_type_id"], name: "index_artworks_on_object_type_id"
    t.index ["user_id"], name: "index_artworks_on_user_id"
  end

  create_table "likes", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "artwork_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["artwork_id"], name: "index_likes_on_artwork_id"
    t.index ["user_id"], name: "index_likes_on_user_id"
  end

  create_table "object_types", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "sessions", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "location"
    t.string "email"
    t.string "img_url"
    t.string "bio"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "password_digest"
    t.integer "balance"
  end

  add_foreign_key "artworks", "artists"
  add_foreign_key "artworks", "object_types"
  add_foreign_key "artworks", "users"
  add_foreign_key "likes", "artworks"
  add_foreign_key "likes", "users"
end

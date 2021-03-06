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

ActiveRecord::Schema.define(version: 20180417172222) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "hstore"

  create_table "books", force: :cascade do |t|
    t.bigint "user_id"
    t.string "isbn"
    t.string "title"
    t.string "image_url"
    t.string "small_image_url"
    t.string "link"
    t.string "num_pages"
    t.string "format"
    t.string "publisher"
    t.string "publication_year"
    t.string "average_rating"
    t.string "ratings_count"
    t.hstore "description"
    t.hstore "authors"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_books_on_user_id"
  end

  create_table "bookstores", force: :cascade do |t|
    t.string "street"
    t.string "city"
    t.string "state"
    t.string "zipcode"
    t.float "latitude"
    t.float "longitude"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "favorites", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "reviews_id"
    t.string "list_name"
    t.string "published_date"
    t.string "title"
    t.string "description"
    t.string "author"
    t.string "isbns"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["reviews_id"], name: "index_favorites_on_reviews_id"
    t.index ["user_id"], name: "index_favorites_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.string "list_name"
    t.string "bestsellers_date"
    t.string "published_date"
    t.string "rank"
    t.string "weeks_on_list"
    t.string "title"
    t.string "description"
    t.string "author"
    t.string "isbns"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "oauth_token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "uid"
    t.string "name"
    t.string "link"
  end

  add_foreign_key "books", "users"
  add_foreign_key "favorites", "reviews", column: "reviews_id"
  add_foreign_key "favorites", "users"
end

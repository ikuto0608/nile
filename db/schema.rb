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

ActiveRecord::Schema.define(version: 20170924000751) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "biddings", force: :cascade do |t|
    t.decimal  "price"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "user_id"
    t.integer  "wishlist_id"
    t.index ["user_id"], name: "index_biddings_on_user_id", using: :btree
    t.index ["wishlist_id"], name: "index_biddings_on_wishlist_id", using: :btree
  end

  create_table "locations", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "city_name"
    t.decimal  "lat"
    t.decimal  "long"
  end

  create_table "reviews", force: :cascade do |t|
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "reviewer_id"
    t.integer  "reviewee_id"
    t.integer  "rating"
    t.string   "description"
    t.integer  "transaction_id"
  end

  create_table "transactions", force: :cascade do |t|
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "buyer_id"
    t.integer  "seller_id"
    t.string   "description"
    t.decimal  "price"
    t.string   "status"
  end

  create_table "user_locations", force: :cascade do |t|
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "user_id"
    t.integer  "location_id"
    t.datetime "start_time"
    t.datetime "end_time"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "instragram_url"
    t.string   "pintrest_url"
    t.string   "tag_line"
    t.string   "full_name"
    t.string   "email"
    t.string   "password_digest"
    t.string   "profile_pic"
  end

  create_table "wishlists", force: :cascade do |t|
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "user_id"
    t.text     "description"
    t.integer  "location_id"
    t.datetime "due_date"
  end

end

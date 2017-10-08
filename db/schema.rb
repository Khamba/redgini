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

ActiveRecord::Schema.define(version: 20171002161112) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string   "name"
    t.string   "line_1"
    t.string   "line_2"
    t.string   "area"
    t.string   "city"
    t.string   "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
  end

  add_index "addresses", ["user_id"], name: "index_addresses_on_user_id", using: :btree

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "line_items", force: :cascade do |t|
    t.integer  "product_id"
    t.integer  "unit_price"
    t.integer  "quantity"
    t.integer  "total"
    t.integer  "shopping_cart_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "line_items", ["product_id"], name: "index_line_items_on_product_id", using: :btree
  add_index "line_items", ["shopping_cart_id"], name: "index_line_items_on_shopping_cart_id", using: :btree

  create_table "orders", force: :cascade do |t|
    t.date     "delivery_date"
    t.string   "delivery_type"
    t.string   "delivery_time"
    t.string   "status"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "user_id"
  end

  add_index "orders", ["user_id"], name: "index_orders_on_user_id", using: :btree

  create_table "products", force: :cascade do |t|
    t.string   "name"
    t.integer  "price"
    t.decimal  "weight",             precision: 10, scale: 2
    t.string   "earliest_delivery"
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "category_id"
    t.string   "product_number"
  end

  add_index "products", ["category_id"], name: "index_products_on_category_id", using: :btree

  create_table "shopping_carts", force: :cascade do |t|
    t.integer  "total"
    t.integer  "order_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "provider"
    t.string   "mobile_number"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.string   "uid"
    t.string   "otp"
    t.boolean  "otp_verified",  default: true
    t.string   "role",          default: "customer"
  end

  add_foreign_key "addresses", "users"
  add_foreign_key "line_items", "products"
  add_foreign_key "line_items", "shopping_carts"
  add_foreign_key "orders", "users"
  add_foreign_key "products", "categories"
end

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

ActiveRecord::Schema[8.1].define(version: 2025_12_30_153735) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "categories", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "name"
    t.datetime "updated_at", null: false
  end

  create_table "customer_order_items", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.bigint "customer_order_id", null: false
    t.decimal "price"
    t.bigint "product_id", null: false
    t.integer "quantity"
    t.datetime "updated_at", null: false
    t.index ["customer_order_id"], name: "index_customer_order_items_on_customer_order_id"
    t.index ["product_id"], name: "index_customer_order_items_on_product_id"
  end

  create_table "customer_orders", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.bigint "customer_id", null: false
    t.datetime "order_date"
    t.decimal "total"
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_customer_orders_on_customer_id"
  end

  create_table "customer_shipping_details", force: :cascade do |t|
    t.string "address"
    t.string "city"
    t.string "country"
    t.datetime "created_at", null: false
    t.bigint "customer_order_id", null: false
    t.string "postal_code"
    t.datetime "updated_at", null: false
    t.index ["customer_order_id"], name: "index_customer_shipping_details_on_customer_order_id"
  end

  create_table "customers", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "email"
    t.string "name"
    t.string "phone"
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.bigint "customer_id", null: false
    t.string "status"
    t.decimal "total"
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_orders_on_customer_id"
  end

  create_table "products", force: :cascade do |t|
    t.bigint "category_id"
    t.datetime "created_at", null: false
    t.string "name"
    t.decimal "price"
    t.integer "stock"
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_products_on_category_id"
  end

  add_foreign_key "customer_order_items", "customer_orders"
  add_foreign_key "customer_order_items", "products"
  add_foreign_key "customer_orders", "customers"
  add_foreign_key "customer_shipping_details", "customer_orders"
  add_foreign_key "orders", "customers"
  add_foreign_key "products", "categories"
end

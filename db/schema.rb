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

ActiveRecord::Schema[7.0].define(version: 2024_06_03_000224) do
  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "billing_addresses", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "address_line_one"
    t.string "address_line_two"
    t.string "state"
    t.string "zip_code"
    t.string "country"
    t.integer "user_id", null: false
    t.integer "order_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_billing_addresses_on_order_id"
    t.index ["user_id"], name: "index_billing_addresses_on_user_id"
  end

  create_table "bundles", force: :cascade do |t|
    t.float "discount_amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bundles_products", id: false, force: :cascade do |t|
    t.integer "bundle_id", null: false
    t.integer "product_id", null: false
    t.index ["bundle_id", "product_id"], name: "index_bundles_products_on_bundle_id_and_product_id"
    t.index ["product_id", "bundle_id"], name: "index_bundles_products_on_product_id_and_bundle_id"
  end

  create_table "carts", force: :cascade do |t|
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_carts_on_user_id"
  end

  create_table "carts_products", id: false, force: :cascade do |t|
    t.integer "cart_id", null: false
    t.integer "product_id", null: false
    t.index ["cart_id", "product_id"], name: "index_carts_products_on_cart_id_and_product_id"
    t.index ["product_id", "cart_id"], name: "index_carts_products_on_product_id_and_cart_id"
  end

  create_table "manufacturers", force: :cascade do |t|
    t.string "endpoint"
    t.string "contact_name"
    t.string "contact_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
  end

  create_table "messages", force: :cascade do |t|
    t.text "content"
    t.integer "ticket_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ticket_id"], name: "index_messages_on_ticket_id"
  end

  create_table "orders", force: :cascade do |t|
    t.string "order_number"
    t.boolean "refunded", default: false
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "title"
    t.string "category"
    t.boolean "featured"
    t.string "product_code"
    t.text "description"
    t.text "specifications"
    t.string "operating_system"
    t.float "price"
    t.float "cost"
    t.float "msrp"
    t.integer "sale_count"
    t.integer "manufacturer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["manufacturer_id"], name: "index_products_on_manufacturer_id"
  end

  create_table "products_promotions", id: false, force: :cascade do |t|
    t.integer "product_id", null: false
    t.integer "promotion_id", null: false
    t.index ["product_id", "promotion_id"], name: "index_products_promotions_on_product_id_and_promotion_id"
    t.index ["promotion_id", "product_id"], name: "index_products_promotions_on_promotion_id_and_product_id"
  end

  create_table "products_wishlists", id: false, force: :cascade do |t|
    t.integer "product_id", null: false
    t.integer "wishlist_id", null: false
    t.index ["product_id", "wishlist_id"], name: "index_products_wishlists_on_product_id_and_wishlist_id"
    t.index ["wishlist_id", "product_id"], name: "index_products_wishlists_on_wishlist_id_and_product_id"
  end

  create_table "promotions", force: :cascade do |t|
    t.datetime "start_date"
    t.datetime "end_date"
    t.float "discount_amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "shipping_addresses", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "address_line_one"
    t.string "address_line_two"
    t.string "state"
    t.string "zip_code"
    t.string "country"
    t.integer "user_id", null: false
    t.integer "order_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_shipping_addresses_on_order_id"
    t.index ["user_id"], name: "index_shipping_addresses_on_user_id"
  end

  create_table "software_keys", force: :cascade do |t|
    t.string "key"
    t.datetime "generated_at"
    t.integer "user_id", null: false
    t.integer "product_id", null: false
    t.integer "order_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_software_keys_on_order_id"
    t.index ["product_id"], name: "index_software_keys_on_product_id"
    t.index ["user_id"], name: "index_software_keys_on_user_id"
  end

  create_table "tickets", force: :cascade do |t|
    t.string "status"
    t.boolean "awaiting_response"
    t.text "notes"
    t.text "resolution"
    t.integer "order_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_tickets_on_order_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "wishlists", force: :cascade do |t|
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_wishlists_on_user_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "billing_addresses", "orders"
  add_foreign_key "billing_addresses", "users"
  add_foreign_key "carts", "users"
  add_foreign_key "messages", "tickets"
  add_foreign_key "orders", "users"
  add_foreign_key "products", "manufacturers"
  add_foreign_key "shipping_addresses", "orders"
  add_foreign_key "shipping_addresses", "users"
  add_foreign_key "software_keys", "orders"
  add_foreign_key "software_keys", "products"
  add_foreign_key "software_keys", "users"
  add_foreign_key "tickets", "orders"
  add_foreign_key "wishlists", "users"
end

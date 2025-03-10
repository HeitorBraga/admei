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

ActiveRecord::Schema.define(version: 2025_03_07_151924) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "hstore"
  enable_extension "pgcrypto"
  enable_extension "plpgsql"
  enable_extension "uuid-ossp"

  create_table "accounts_payables", force: :cascade do |t|
    t.string "name"
    t.date "date"
    t.integer "price"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

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
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.string "service_name", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "addresses", force: :cascade do |t|
    t.string "addressable_type", limit: 50, null: false
    t.integer "addressable_id"
    t.string "zip", limit: 10, null: false
    t.string "address", limit: 100, null: false
    t.string "number", limit: 20
    t.string "more", limit: 100
    t.string "district", limit: 100, null: false
    t.bigint "city_id", null: false
    t.jsonb "data", default: "{}", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.index ["addressable_id", "addressable_type"], name: "index_addresses_on_addressable_id_and_addressable_type"
    t.index ["city_id"], name: "index_addresses_on_city_id"
  end

  create_table "apps", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.string "secret", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "backoffice_contracts", force: :cascade do |t|
    t.string "contract_key"
    t.integer "users"
    t.integer "terminals"
    t.integer "concurrent_instances"
    t.integer "installations"
    t.decimal "price", precision: 16, scale: 3
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "cash_registers", force: :cascade do |t|
    t.float "amount"
    t.bigint "payment_method_id", null: false
    t.integer "month"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "add_money", default: true
    t.index ["payment_method_id"], name: "index_cash_registers_on_payment_method_id"
  end

  create_table "cities", force: :cascade do |t|
    t.string "name", limit: 100, null: false
    t.bigint "state_id", null: false
    t.integer "ibge_code", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["ibge_code"], name: "index_cities_on_ibge_code", unique: true
    t.index ["name"], name: "index_cities_on_name"
    t.index ["state_id"], name: "index_cities_on_state_id"
  end

  create_table "collaborators", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "companies", force: :cascade do |t|
    t.string "trade_name", limit: 100, null: false
    t.string "legal_name", limit: 100, null: false
    t.string "federal_tax_id", limit: 25
    t.string "state_tax_id", limit: 25
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "company_positions", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "costs", force: :cascade do |t|
    t.bigint "product_cost_id"
    t.string "ingredient"
    t.integer "unit"
    t.integer "quantity"
    t.float "price"
    t.integer "quantity_used"
    t.float "cost"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "own_product"
    t.integer "product_id"
    t.index ["product_cost_id"], name: "index_costs_on_product_cost_id"
  end

  create_table "countries", force: :cascade do |t|
    t.string "name", limit: 100, null: false
    t.string "iso_code", limit: 5, null: false
    t.integer "ibge_code", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["ibge_code"], name: "index_countries_on_ibge_code", unique: true
    t.index ["iso_code"], name: "index_countries_on_iso_code", unique: true
  end

  create_table "employee_absences", force: :cascade do |t|
    t.bigint "employee_id", null: false
    t.date "date"
    t.string "reason"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["employee_id"], name: "index_employee_absences_on_employee_id"
  end

  create_table "employee_overtimes", force: :cascade do |t|
    t.bigint "employee_id", null: false
    t.date "date"
    t.integer "hours"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["employee_id"], name: "index_employee_overtimes_on_employee_id"
  end

  create_table "employees", force: :cascade do |t|
    t.string "name"
    t.string "phone"
    t.bigint "company_position_id", null: false
    t.float "wage"
    t.date "entry_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "receives"
    t.integer "receives_when"
    t.date "entred_in", null: false
    t.date "came_out_in"
    t.boolean "commission", default: false
    t.integer "commission_percentage"
    t.bigint "user_id", null: false
    t.string "email"
    t.index ["company_position_id"], name: "index_employees_on_company_position_id"
    t.index ["user_id"], name: "index_employees_on_user_id"
  end

  create_table "fabrications", force: :cascade do |t|
    t.date "date", null: false
    t.bigint "product_id", null: false
    t.integer "quantity"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["product_id"], name: "index_fabrications_on_product_id"
  end

  create_table "jwt_denylists", force: :cascade do |t|
    t.string "jti", null: false
    t.datetime "exp", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["jti"], name: "index_jwt_denylists_on_jti", unique: true
  end

  create_table "pay_latters", force: :cascade do |t|
    t.float "price", null: false
    t.date "date", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "collaborator"
    t.string "name"
    t.string "phone"
    t.boolean "for_collaborator"
    t.bigint "payment_method_id", null: false
    t.index ["payment_method_id"], name: "index_pay_latters_on_payment_method_id"
  end

  create_table "payment_methods", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "permissions", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.boolean "categories_and_products", default: false
    t.boolean "company_positions_and_employees", default: false
    t.boolean "collaborators", default: false
    t.boolean "production", default: true
    t.boolean "sales", default: false
    t.boolean "spendings", default: false
    t.boolean "payment_methods", default: false
    t.boolean "pay_latters_and_accounts_payables"
    t.boolean "costs", default: false
    t.boolean "permissions", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "company", default: false
    t.index ["user_id"], name: "index_permissions_on_user_id"
  end

  create_table "product_categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "product_costs", force: :cascade do |t|
    t.bigint "product_id", null: false
    t.float "cost"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "products_quantity"
    t.float "cost_unit"
    t.index ["product_id"], name: "index_product_costs_on_product_id"
  end

  create_table "product_solds", force: :cascade do |t|
    t.bigint "sale_id", null: false
    t.integer "product", null: false
    t.integer "quantity", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["sale_id"], name: "index_product_solds_on_sale_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.bigint "product_category_id"
    t.float "price"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["product_category_id"], name: "index_products_on_product_category_id"
  end

  create_table "profits", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "sales", force: :cascade do |t|
    t.date "date", null: false
    t.float "invoicing", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "pay_latter", default: false
    t.string "name"
    t.string "phone"
    t.bigint "collaborator_id"
    t.boolean "for_collaborator"
    t.bigint "payment_method_id", null: false
    t.boolean "for_seller", default: false
    t.integer "employee"
    t.index ["collaborator_id"], name: "index_sales_on_collaborator_id"
    t.index ["payment_method_id"], name: "index_sales_on_payment_method_id"
  end

  create_table "settings", force: :cascade do |t|
    t.string "name", limit: 255, null: false
    t.string "value", null: false
    t.string "data_type", limit: 50, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "spendings", force: :cascade do |t|
    t.string "origin", null: false
    t.date "date", null: false
    t.float "price", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "payment_method_id"
    t.index ["payment_method_id"], name: "index_spendings_on_payment_method_id"
  end

  create_table "states", force: :cascade do |t|
    t.string "name", limit: 100, null: false
    t.string "uf", limit: 2, null: false
    t.integer "ibge_code", null: false
    t.bigint "country_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["country_id"], name: "index_states_on_country_id"
    t.index ["ibge_code"], name: "index_states_on_ibge_code", unique: true
    t.index ["name"], name: "index_states_on_name"
  end

  create_table "sub_products", force: :cascade do |t|
    t.string "name", null: false
    t.integer "quantity", null: false
    t.float "price", null: false
    t.bigint "spending_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["spending_id"], name: "index_sub_products_on_spending_id"
  end

  create_table "tenants", force: :cascade do |t|
    t.string "subdomain", limit: 20, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "public_token"
    t.string "secret_token"
    t.index ["public_token"], name: "index_tenants_on_public_token", unique: true
    t.index ["secret_token"], name: "index_tenants_on_secret_token", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "cash_registers", "payment_methods"
  add_foreign_key "cities", "states"
  add_foreign_key "employee_absences", "employees"
  add_foreign_key "employee_overtimes", "employees"
  add_foreign_key "employees", "company_positions"
  add_foreign_key "employees", "users"
  add_foreign_key "pay_latters", "payment_methods"
  add_foreign_key "permissions", "users"
  add_foreign_key "product_costs", "products"
  add_foreign_key "product_solds", "sales"
  add_foreign_key "sales", "collaborators"
  add_foreign_key "sales", "payment_methods"
  add_foreign_key "spendings", "payment_methods"
  add_foreign_key "states", "countries"
  add_foreign_key "sub_products", "spendings"
end

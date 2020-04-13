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

ActiveRecord::Schema.define(version: 2020_04_13_175328) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "invoice_infos", force: :cascade do |t|
    t.bigint "invoice_id", null: false
    t.text "description", null: false
    t.integer "quantity", null: false
    t.float "price_of_one", default: 0.0
    t.float "total_cost", default: 0.0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["invoice_id"], name: "index_invoice_infos_on_invoice_id"
  end

  create_table "invoices", force: :cascade do |t|
    t.bigint "orgnaization_id", null: false
    t.string "name", null: false
    t.string "address"
    t.integer "invoice_type", default: 1
    t.string "invoice_number", null: false
    t.float "amount_paid", default: 0.0
    t.float "remaining", default: 0.0
    t.float "total_cost", default: 0.0
    t.integer "status", default: 1, null: false
    t.date "date", null: false
    t.text "description"
    t.integer "currency_type", default: 1, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["orgnaization_id"], name: "index_invoices_on_orgnaization_id"
    t.index ["status"], name: "index_invoices_on_status"
  end

  create_table "orgnaizations", force: :cascade do |t|
    t.string "name", null: false
    t.string "slug", null: false
    t.string "address", null: false
    t.string "phone_numbers"
    t.string "email"
    t.string "services"
    t.text "description"
    t.string "city"
    t.integer "status", default: 1, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["slug", "status"], name: "index_orgnaizations_on_slug_and_status"
  end

  create_table "users", force: :cascade do |t|
    t.string "full_name", null: false
    t.string "user_name", null: false
    t.integer "code_country", default: 967
    t.string "mobile", null: false
    t.boolean "is_master", default: false
    t.string "email"
    t.string "city"
    t.string "region"
    t.string "password_digest"
    t.integer "role"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "orgnaization_id"
    t.index ["mobile", "status"], name: "index_users_on_mobile_and_status"
    t.index ["orgnaization_id"], name: "index_users_on_orgnaization_id"
  end

  add_foreign_key "invoice_infos", "invoices", on_delete: :cascade
  add_foreign_key "invoices", "orgnaizations", on_delete: :cascade
  add_foreign_key "users", "orgnaizations", on_delete: :cascade
end

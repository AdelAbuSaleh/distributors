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

ActiveRecord::Schema.define(version: 2019_10_06_125351) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "call_centers", force: :cascade do |t|
    t.string "name", null: false
    t.string "address", null: false
    t.string "phone_numer"
    t.string "services"
    t.string "email"
    t.text "description"
    t.integer "status", default: 1, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slag", default: "", null: false
    t.index ["name", "status"], name: "index_call_centers_on_name_and_status"
  end

  create_table "distributor_operations", force: :cascade do |t|
    t.string "name"
    t.integer "operation_type", null: false
    t.integer "quantity", null: false
    t.integer "units_number"
    t.float "cost", null: false
    t.float "total", null: false
    t.text "description"
    t.datetime "opration_date", null: false
    t.integer "status", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "invoice_id"
    t.index ["invoice_id"], name: "index_distributor_operations_on_invoice_id"
    t.index ["name", "cost", "total"], name: "index_distributor_operations_on_name_and_cost_and_total"
  end

  create_table "employees_call_centers", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "call_center_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["call_center_id"], name: "index_employees_call_centers_on_call_center_id"
    t.index ["user_id"], name: "index_employees_call_centers_on_user_id"
  end

  create_table "invoices", force: :cascade do |t|
    t.string "ref"
    t.text "description"
    t.date "invoices_date"
    t.time "invoices_time"
    t.bigint "user_id", null: false
    t.bigint "call_center_id", null: false
    t.integer "invoice_type"
    t.float "total"
    t.float "discount"
    t.float "net"
    t.float "remaining_from_previous_invoice"
    t.float "amount_paid"
    t.float "amount_not_paid"
    t.float "remaining_amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["call_center_id"], name: "index_invoices_on_call_center_id"
    t.index ["ref", "total"], name: "index_invoices_on_ref_and_total"
    t.index ["user_id"], name: "index_invoices_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "full_name"
    t.string "user_name"
    t.string "email"
    t.integer "country_code"
    t.string "mobile"
    t.string "password_digest"
    t.integer "role"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true, where: "(email IS NOT NULL)"
    t.index ["mobile"], name: "index_users_on_mobile", unique: true, where: "(mobile IS NOT NULL)"
  end

  add_foreign_key "distributor_operations", "invoices", on_delete: :cascade
  add_foreign_key "employees_call_centers", "call_centers", on_delete: :cascade
  add_foreign_key "employees_call_centers", "users", on_delete: :cascade
  add_foreign_key "invoices", "call_centers", on_delete: :cascade
  add_foreign_key "invoices", "users", on_delete: :cascade
end

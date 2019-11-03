# frozen_string_literal: true

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

ActiveRecord::Schema.define(version: 20_191_031_074_317) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'orgnaizations', force: :cascade do |t|
    t.string 'name', null: false
    t.string 'slug', null: false
    t.string 'address', null: false
    t.string 'first_number'
    t.string 'second_number'
    t.string 'third_number'
    t.string 'mobile'
    t.string 'email'
    t.string 'services'
    t.text 'description'
    t.integer 'status', default: 1, null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['email'], name: 'index_orgnaizations_on_email', unique: true, where: '(email IS NOT NULL)'
    t.index %w[mobile status], name: 'index_orgnaizations_on_mobile_and_status'
  end

  create_table 'provider_operations', force: :cascade do |t|
    t.bigint 'orgnaization_id', null: false
    t.bigint 'provider_id', null: false
    t.integer 'name'
    t.integer 'operation_type'
    t.integer 'units_number'
    t.float 'cost', default: 0.0
    t.float 'discount', default: 0.0
    t.float 'amount_paid', default: 0.0
    t.float 'remaining', default: 0.0
    t.float 'total', default: 0.0
    t.integer 'status'
    t.text 'description'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['orgnaization_id'], name: 'index_provider_operations_on_orgnaization_id'
    t.index ['provider_id'], name: 'index_provider_operations_on_provider_id'
    t.index ['status'], name: 'index_provider_operations_on_status'
  end

  create_table 'providers', force: :cascade do |t|
    t.string 'full_name'
    t.string 'email'
    t.string 'city'
    t.string 'region'
    t.integer 'code_country', default: 967
    t.string 'mobile'
    t.string 'password_digest'
    t.integer 'status'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['email'], name: 'index_providers_on_email', unique: true, where: '(email IS NOT NULL)'
    t.index ['status'], name: 'index_providers_on_status'
  end

  create_table 'requests', force: :cascade do |t|
    t.bigint 'user_id', null: false
    t.bigint 'provider_id', null: false
    t.string 'name'
    t.integer 'request_type'
    t.integer 'units_number'
    t.integer 'quantity'
    t.integer 'status'
    t.text 'description'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['provider_id'], name: 'index_requests_on_provider_id'
    t.index ['status'], name: 'index_requests_on_status'
    t.index ['user_id'], name: 'index_requests_on_user_id'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'full_name'
    t.string 'email'
    t.string 'city'
    t.string 'region'
    t.integer 'code_country', default: 967
    t.string 'mobile'
    t.string 'password_digest'
    t.integer 'role'
    t.integer 'status'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.bigint 'orgnaization_id'
    t.index ['email'], name: 'index_users_on_email', unique: true, where: '(email IS NOT NULL)'
    t.index %w[mobile status], name: 'index_users_on_mobile_and_status'
    t.index ['orgnaization_id'], name: 'index_users_on_orgnaization_id'
  end

  create_table 'v1_orgnaizations', force: :cascade do |t|
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'v1_provider_operations', force: :cascade do |t|
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'v1_providers', force: :cascade do |t|
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'v1_requests', force: :cascade do |t|
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'v1_sessions', force: :cascade do |t|
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'v1_users', force: :cascade do |t|
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  add_foreign_key 'provider_operations', 'orgnaizations', on_delete: :cascade
  add_foreign_key 'provider_operations', 'providers', on_delete: :cascade
  add_foreign_key 'requests', 'providers', on_delete: :cascade
  add_foreign_key 'requests', 'users', on_delete: :cascade
  add_foreign_key 'users', 'orgnaizations', on_delete: :cascade
end

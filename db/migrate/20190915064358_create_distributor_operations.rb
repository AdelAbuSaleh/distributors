# frozen_string_literal: true

class CreateDistributorOperations < ActiveRecord::Migration[5.2]
  def change
    create_table :distributor_operations do |t|
      t.belongs_to :user, null: false, foreign_key: { on_delete: :cascade }, index: true
      t.belongs_to :call_center, null: false, foreign_key: { on_delete: :cascade }, index: true
      t.string :name
      t.integer :operation_type, null: false, defaulte: 1
      t.integer :quantity, null: false, defaulte: 1
      t.integer :units_number
      t.float :cost, null: false, defaulte: 0.0
      t.float :total, null: false, defaulte: 0.0
      t.text :description
      t.datetime :opration_date, null: false
      t.integer :status, null: false, defaulte: 1

      t.timestamps
      t.index(%i[name cost total])
    end
  end
end

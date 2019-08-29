# frozen_string_literal: true

class CreateEmployeesCallCenters < ActiveRecord::Migration[5.2]
  def change
    create_table :employees_call_centers do |t|
      t.belongs_to :user, null: false, foreign_key: { on_delete: :cascade }, index: true
      t.belongs_to :call_center, null: false, foreign_key: { on_delete: :cascade }, index: true

      t.timestamps
    end
  end
end

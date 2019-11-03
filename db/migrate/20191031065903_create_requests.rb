# frozen_string_literal: true

class CreateRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :requests do |t|
      t.belongs_to :user, null: false, foreign_key: { on_delete: :cascade }, index: true
      t.belongs_to :provider, null: false, foreign_key: { on_delete: :cascade }, index: true

      t.string :name
      t.integer :request_type
      t.integer :units_number
      t.integer :quantity
      t.integer :status
      t.text :description

      t.timestamps

      t.index(:status)
    end
  end
end

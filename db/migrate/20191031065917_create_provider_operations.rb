class CreateProviderOperations < ActiveRecord::Migration[5.2]
  def change
    create_table :provider_operations do |t|
      t.belongs_to :orgnaization, null: false, foreign_key: { on_delete: :cascade }, index: true
      t.belongs_to :provider, null: false, foreign_key: { on_delete: :cascade }, index: true

      t.integer :name
      t.integer :operation_type
      t.integer :units_number
      t.float :cost, default: 0.0
      t.float :discount, default: 0.0
      t.float :amount_paid, default: 0.0
      t.float :remaining, default: 0.0
      t.float :total, default: 0.0
      t.integer :status
      t.text :description

      t.timestamps

      t.index(:status)
    end
  end
end

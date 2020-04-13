class CreateInvoices < ActiveRecord::Migration[5.2]
  def change
    create_table :invoices do |t|
      t.belongs_to :orgnaization, null: false, foreign_key: { on_delete: :cascade }, index: true

      t.string :name, null: false
      t.string :address
      t.integer :invoice_type, default: 1
      t.string :invoice_number, null: false
      t.float :amount_paid, default: 0.0
      t.float :remaining, default: 0.0
      t.float :total_cost, default: 0.0
      t.integer :status, null: false, default: 1
      t.date :date, null: false
      t.text :description
      t.integer :currency_type, null: false, default: 1

      t.timestamps

      t.index(:status)
    end
  end
end

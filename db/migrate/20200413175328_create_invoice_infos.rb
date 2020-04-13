class CreateInvoiceInfos < ActiveRecord::Migration[5.2]
  def change
    create_table :invoice_infos do |t|
      t.belongs_to :invoice, null: false, foreign_key: { on_delete: :cascade }, index: true

      t.text :description, null: false
      t.integer :quantity, null: false
      t.float :price_of_one, default: 0.0
      t.float :total_cost, default: 0.0

      t.timestamps
    end
  end
end

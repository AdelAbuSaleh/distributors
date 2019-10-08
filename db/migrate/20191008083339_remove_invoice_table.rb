class RemoveInvoiceTable < ActiveRecord::Migration[5.2]
  def change
    drop_table :invoices, force: :cascade
    remove_reference :distributor_operations, :invoice#, foreign_key: true
    add_reference :distributor_operations, :user, foreign_key: { on_delete: :cascade }, index: true
    add_reference :distributor_operations, :call_center, foreign_key: { on_delete: :cascade }, index: true
  end
end

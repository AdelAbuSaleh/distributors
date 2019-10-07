class CreateInvoices < ActiveRecord::Migration[5.2]
  def change
    create_table :invoices do |t|
      t.string :ref
      t.text :description
      t.date :invoices_date
      t.time :invoices_time
      t.belongs_to :user, null: false, foreign_key: { on_delete: :cascade }, index: true
      t.belongs_to :call_center, null: false, foreign_key: { on_delete: :cascade }, index: true
      t.integer :invoice_type
      t.float :total
      t.float :discount
      t.float :net
      t.float :remaining_from_previous_invoice
      t.float :amount_paid
      t.float :amount_not_paid
      t.float :remaining_amount

      t.timestamps
      t.index(%i[ref total])
    end

    Invoice.create(user_id: DistributorOperation.last.user_id,
                   call_center_id: DistributorOperation.last.call_center_id,
                   ref: 'test',
                   description: 'test',
                   invoices_date: '6/10/2019',
                   invoices_time: '12:01:22',
                   invoice_type: '0',
                   total: DistributorOperation.with_status(:not_paid).pluck(:total).sum,
                   discount: '0',
                   net: DistributorOperation.with_status(:not_paid).pluck(:total).sum,
                   remaining_from_previous_invoice: DistributorOperation.with_status(:not_paid).pluck(:total).sum,
                   amount_paid: '0',
                   amount_not_paid: DistributorOperation.with_status(:not_paid).pluck(:total).sum,
                   remaining_amount: DistributorOperation.with_status(:not_paid).pluck(:total).sum)

    remove_reference :distributor_operations, :user, foreign_key: true
    remove_reference :distributor_operations, :call_center, foreign_key: true
    add_reference :distributor_operations, :invoice, foreign_key: { on_delete: :cascade }, index: true
  end
end

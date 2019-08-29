# frozen_string_literal: true

class CreateCallCenters < ActiveRecord::Migration[5.2]
  def change
    create_table :call_centers do |t|
      t.string :name, null: false
      t.string :address, null: false
      t.string :phone_numer
      t.string :services
      t.string :email
      t.text :description
      t.integer :status, null: false, default: 1

      t.timestamps
      t.index(%i[name status])
    end
  end
end

# frozen_string_literal: true

class CreateOrgnaizations < ActiveRecord::Migration[5.2]
  def change
    create_table :orgnaizations do |t|
      t.string :name, null: false, unique: true
      t.string :slug, null: false, unique: true
      t.string :address, null: false
      t.string :phone_numbers
      t.string :email
      t.string :services
      t.text :description
      t.string  :city
      t.integer :status, null: false, default: 1

      t.timestamps

      t.index(%i[slug status])
    end
  end
end

# frozen_string_literal: true

class CreateOrgnaizations < ActiveRecord::Migration[5.2]
  def change
    create_table :orgnaizations do |t|
      t.string :name, null: false, unique: true
      t.string :slug, null: false, unique: true
      t.string :address, null: false
      t.string :first_number
      t.string :second_number
      t.string :third_number
      t.string :mobile
      t.string :email
      t.string :services
      t.text :description
      t.integer :status, null: false, default: 1

      t.timestamps

      t.index(:email, unique: true, where: 'email IS NOT NULL')
      t.index(%i[mobile status])
    end
  end
end

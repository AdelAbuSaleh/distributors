# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string  :full_name, null: false
      t.string  :user_name, null: false
      t.integer :code_country, default: '00967'
      t.string  :mobile, null: false
      t.boolean :is_master, default: false
      t.string  :email
      t.string  :city
      t.string  :region
      t.string  :password_digest
      t.integer :role, defualt: 2
      t.integer :status, defualt: 1
      t.timestamps

      t.index(%i[mobile status])
    end
  end
end

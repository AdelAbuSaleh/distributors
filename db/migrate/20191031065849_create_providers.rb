# frozen_string_literal: true

class CreateProviders < ActiveRecord::Migration[5.2]
  def change
    create_table :providers do |t|
      t.string :full_name
      t.string :email
      t.string :city
      t.string :region
      t.integer :code_country, default: '00967'
      t.string :mobile
      t.string :password_digest
      t.integer :status, defualt: 1

      t.timestamps

      t.index(:email, unique: true, where: 'email IS NOT NULL')
      t.index(:status)
    end
  end
end

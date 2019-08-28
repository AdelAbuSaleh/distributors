class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :full_name
      t.string :user_name
      t.string :email
      t.integer :country_code
      t.string :mobile
      t.string :password_digest
      t.integer :role, defualt: 1
      t.integer :status, defualt: 1

      t.timestamps

      t.index(:email, unique: true, where: 'email IS NOT NULL')
      t.index(:mobile, unique: true, where: 'mobile IS NOT NULL')
    end
  end
end

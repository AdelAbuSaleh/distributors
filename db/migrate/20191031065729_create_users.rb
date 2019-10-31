class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :full_name
      t.string :email
      t.string :city
      t.string :region
      t.integer :code_country, default: '00967'
      t.string :mobile
      t.string :password_digest
      t.integer :role, defualt: 1
      t.integer :status, defualt: 1

      t.timestamps

      t.index(:email, unique: true, where: 'email IS NOT NULL')
      t.index(%i[mobile status])
    end
  end
end

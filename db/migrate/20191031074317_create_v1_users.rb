class CreateV1Users < ActiveRecord::Migration[5.2]
  def change
    create_table :v1_users do |t|

      t.timestamps
    end
  end
end

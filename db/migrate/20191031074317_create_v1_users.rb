# frozen_string_literal: true

class CreateV1Users < ActiveRecord::Migration[5.2]
  def change
    create_table :v1_users, &:timestamps
  end
end

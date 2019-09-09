# frozen_string_literal: true

class AddSlagToCallCenterTable < ActiveRecord::Migration[5.2]
  def change
    add_column :call_centers, :slag, :string, null: false, default: ''
  end
end

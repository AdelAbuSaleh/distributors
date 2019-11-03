# frozen_string_literal: true

class AddOrgnaizationRefranceToUsers < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, :orgnaization, foreign_key: { on_delete: :cascade }, index: true
  end
end

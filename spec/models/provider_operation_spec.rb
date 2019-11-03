# frozen_string_literal: true

# == Schema Information
#
# Table name: provider_operations
#
#  id              :bigint           not null, primary key
#  orgnaization_id :bigint           not null
#  provider_id     :bigint           not null
#  name            :integer
#  operation_type  :integer
#  units_number    :integer
#  cost            :float            default(0.0)
#  discount        :float            default(0.0)
#  amount_paid     :float            default(0.0)
#  remaining       :float            default(0.0)
#  total           :float            default(0.0)
#  status          :integer
#  description     :text
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'rails_helper'

RSpec.describe ProviderOperation, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

# frozen_string_literal: true

# == Schema Information
#
# Table name: distributor_operations
#
#  id             :bigint           not null, primary key
#  name           :string
#  operation_type :integer          not null
#  quantity       :integer          not null
#  units_number   :integer
#  cost           :float            not null
#  total          :float            not null
#  description    :text
#  opration_date  :datetime         not null
#  status         :integer          not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  invoice_id     :bigint
#

require 'rails_helper'

RSpec.describe DistributorOperation, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

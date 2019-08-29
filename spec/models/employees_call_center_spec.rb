# frozen_string_literal: true

# == Schema Information
#
# Table name: employees_call_centers
#
#  id             :bigint           not null, primary key
#  user_id        :bigint           not null
#  call_center_id :bigint           not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

require 'rails_helper'

RSpec.describe EmployeesCallCenter, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

# frozen_string_literal: true

# == Schema Information
#
# Table name: requests
#
#  id           :bigint           not null, primary key
#  user_id      :bigint           not null
#  provider_id  :bigint           not null
#  name         :string
#  request_type :integer
#  units_number :integer
#  quantity     :integer
#  status       :integer
#  description  :text
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require 'rails_helper'

RSpec.describe Request, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

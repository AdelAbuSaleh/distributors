# frozen_string_literal: true

# == Schema Information
#
# Table name: call_centers
#
#  id          :bigint           not null, primary key
#  name        :string           not null
#  address     :string           not null
#  phone_numer :string
#  services    :string
#  email       :string
#  description :text
#  status      :integer          default("inactive"), not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'rails_helper'

RSpec.describe CallCenter, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

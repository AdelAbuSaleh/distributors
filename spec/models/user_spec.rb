# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  full_name       :string
#  email           :string
#  city            :string
#  region          :string
#  code_country    :integer          default(967)
#  mobile          :string
#  password_digest :string
#  role            :integer
#  status          :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  orgnaization_id :bigint
#

require 'rails_helper'

RSpec.describe User, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

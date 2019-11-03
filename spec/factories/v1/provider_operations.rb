# frozen_string_literal: true

# == Schema Information
#
# Table name: v1_provider_operations
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryBot.define do
  factory :v1_provider_operation, class: 'V1::ProviderOperation' do
  end
end

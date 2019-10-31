# == Schema Information
#
# Table name: v1_providers
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryBot.define do
  factory :v1_provider, class: 'V1::Provider' do
    
  end
end

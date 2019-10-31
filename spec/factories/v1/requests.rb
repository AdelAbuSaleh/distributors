# == Schema Information
#
# Table name: v1_requests
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryBot.define do
  factory :v1_request, class: 'V1::Request' do
    
  end
end

# == Schema Information
#
# Table name: v1_sessions
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryBot.define do
  factory :v1_session, class: 'V1::Session' do
    
  end
end

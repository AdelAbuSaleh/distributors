# == Schema Information
#
# Table name: providers
#
#  id              :bigint           not null, primary key
#  full_name       :string
#  email           :string
#  city            :string
#  region          :string
#  code_country    :integer          default(967)
#  mobile          :string
#  password_digest :string
#  status          :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

FactoryBot.define do
  factory :provider do
    
  end
end

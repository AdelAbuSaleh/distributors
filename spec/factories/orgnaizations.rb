# == Schema Information
#
# Table name: orgnaizations
#
#  id            :bigint           not null, primary key
#  name          :string           not null
#  slug          :string           not null
#  address       :string           not null
#  first_number  :string
#  second_number :string
#  third_number  :string
#  mobile        :string
#  email         :string
#  services      :string
#  description   :text
#  status        :integer          default("inactive"), not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

FactoryBot.define do
  factory :orgnaization do
    
  end
end

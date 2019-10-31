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

class Request < ApplicationRecord
  ## -------------------- Requirements -------------------- ##
  ## ----------------------- Scopes ----------------------- ##
  ## --------------------- Constants ---------------------- ##
  ## ----------------------- Enums ------------------------ ##
  ## -------------------- Associations -------------------- ##
  belongs_to :user
  belongs_to :provider
  ## -------------------- Validations --------------------- ##
  ## --------------------- Callbacks ---------------------- ##
  ## ------------------- Class Methods -------------------- ##
  ## ---------------------- Methods ----------------------- ##
end

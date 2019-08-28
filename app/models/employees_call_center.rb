# == Schema Information
#
# Table name: employees_call_centers
#
#  id             :bigint           not null, primary key
#  user_id        :bigint           not null
#  call_center_id :bigint           not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class EmployeesCallCenter < ApplicationRecord
  ## -------------------- Requirements -------------------- ##
  ## ----------------------- Scopes ----------------------- ##
  ## --------------------- Constants ---------------------- ##
  ## ----------------------- Enums ------------------------ ##
  ## -------------------- Associations -------------------- ##
  belongs_to :user
  belongs_to :call_center
  ## -------------------- Validations --------------------- ##
  ## --------------------- Callbacks ---------------------- ##
  ## ------------------- Class Methods -------------------- ##
  ## ---------------------- Methods ----------------------- ##
end

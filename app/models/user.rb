# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  full_name       :string
#  user_name       :string
#  email           :string
#  country_code    :integer
#  mobile          :string
#  password_digest :string
#  role            :integer
#  status          :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ApplicationRecord
  ## -------------------- Requirements -------------------- ##
  has_secure_password
  extend Enumerize
  ## ----------------------- Scopes ----------------------- ##
  ## --------------------- Constants ---------------------- ##
  ## ----------------------- Enums ------------------------ ##
  enumerize :role, in: {
    admin: 0,
    employee: 1
  }, default: 1, scope: true, predicates: true

  # User statuses
  enumerize :status, in: {
    active: 0,
    inactive: 1
  }, default: 1, scope: true, predicates: true
  ## -------------------- Associations -------------------- ##
  ## -------------------- Validations --------------------- ##
  validates :role, presence: true
  validates :status, presence: true
  ## --------------------- Callbacks ---------------------- ##
  ## ------------------- Class Methods -------------------- ##
  ## ---------------------- Methods ----------------------- ##
end

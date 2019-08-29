# frozen_string_literal: true

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
    super_admin: 0,
    employee: 1,
    admin: 2
  }, default: 1, scope: true, predicates: true

  # User statuses
  enumerize :status, in: {
    active: 0,
    inactive: 1
  }, default: 1, scope: true, predicates: true
  ## -------------------- Associations -------------------- ##
  has_many :employees_call_centers
  has_many :call_centers, through: :employees_call_centers

  # accepts_nested_attributes_for :call_centers#, reject_if: :all_blank
  ## -------------------- Validations --------------------- ##
  validates :role, presence: true
  validates :status, presence: true
  ## --------------------- Callbacks ---------------------- ##
  ## ------------------- Class Methods -------------------- ##
  ## ---------------------- Methods ----------------------- ##
end

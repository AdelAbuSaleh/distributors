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
    admin: 1,
    employee: 2,
    distributor: 3
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
  # validates :role, :status, presence: true
  validates :role, presence: true
  validates :status, presence: true
  validates :call_center_ids, presence: true, if: (->(e) { e.employee? || e.admin? })
  ## --------------------- Callbacks ---------------------- ##
  ## ------------------- Class Methods -------------------- ##
  ## ---------------------- Methods ----------------------- ##
  class << self
    def login(email:, password:)
      user = find_by(email: email.downcase)
      return false if user.blank? || user.password_digest.nil?

      user.authenticate(password) || false
    end
  end
  # JWT payload
  def login_payload
    {
      id: id,
      user_name: user_name,
      role: role,
      email: email
    }
  end
end

# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  full_name       :string
#  email           :string
#  city            :string
#  region          :string
#  code_country    :integer          default(967)
#  mobile          :string
#  password_digest :string
#  role            :integer
#  status          :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  orgnaization_id :bigint
#

class User < ApplicationRecord
  ## -------------------- Requirements -------------------- ##
  has_secure_password
  extend Enumerize
  # include UserPresenter
  ## ----------------------- Scopes ----------------------- ##
  ## --------------------- Constants ---------------------- ##
  ## ----------------------- Enums ------------------------ ##
  enumerize :role, in: {
    super_admin: 0,
    admin: 1,
    employee: 2
  }, default: 1, scope: true, predicates: true

  # User statuses
  enumerize :status, in: {
    active: 0,
    inactive: 1
  }, default: 1, scope: true, predicates: true
  ## -------------------- Associations -------------------- ##
  belongs_to :orgnaization
  has_many :requests

  # has_many :providers
  ## -------------------- Validations --------------------- ##
  validates :role, presence: true
  validates :status, presence: true
  validates :full_name, presence: true
  validates :email, presence: true, uniqueness: true
  ## --------------------- Callbacks ---------------------- ##
  ## ------------------- Class Methods -------------------- ##
  ## ---------------------- Methods ----------------------- ##
  delegate :id, :slug, :name, :email, to: :orgnaization, prefix: true, allow_nil: true
end

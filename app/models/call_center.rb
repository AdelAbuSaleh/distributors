# frozen_string_literal: true

# == Schema Information
#
# Table name: call_centers
#
#  id          :bigint           not null, primary key
#  name        :string           not null
#  address     :string           not null
#  phone_numer :string
#  services    :string
#  email       :string
#  description :text
#  status      :integer          default("inactive"), not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class CallCenter < ApplicationRecord
  ## -------------------- Requirements -------------------- ##
  extend Enumerize
  ## ----------------------- Scopes ----------------------- ##
  ## --------------------- Constants ---------------------- ##
  ## ----------------------- Enums ------------------------ ##
  # statuses
  enumerize :status, in: {
    active: 0,
    inactive: 1
  }, default: 1, scope: true, predicates: true
  ## -------------------- Associations -------------------- ##
  has_many :employees_call_centers
  has_many :users, through: :employees_call_centers
  ## -------------------- Validations --------------------- ##
  ## --------------------- Callbacks ---------------------- ##
  ## ------------------- Class Methods -------------------- ##
  ## ---------------------- Methods ----------------------- ##
end

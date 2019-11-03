# frozen_string_literal: true

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

class Provider < ApplicationRecord
  ## -------------------- Requirements -------------------- ##
  # include ProviderPresenter
  has_secure_password
  ## ----------------------- Scopes ----------------------- ##
  ## --------------------- Constants ---------------------- ##
  ## ----------------------- Enums ------------------------ ##
  ## -------------------- Associations -------------------- ##
  has_many :provider_operations
  has_many :requests

  # belongs_to :user
  ## -------------------- Validations --------------------- ##
  ## --------------------- Callbacks ---------------------- ##
  ## ------------------- Class Methods -------------------- ##
  ## ---------------------- Methods ----------------------- ##
end

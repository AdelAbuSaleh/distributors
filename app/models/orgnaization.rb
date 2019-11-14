# frozen_string_literal: true

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

class Orgnaization < ApplicationRecord
  ## -------------------- Requirements -------------------- ##
  extend Enumerize
  # include OrgnaizationPresenter
  ## ----------------------- Scopes ----------------------- ##
  ## --------------------- Constants ---------------------- ##
  ## ----------------------- Enums ------------------------ ##
  enumerize :status, in: {
    active: 0,
    inactive: 1
  }, default: 1, scope: true, predicates: true
  ## -------------------- Associations -------------------- ##
  has_many :users
  has_many :provider_operations # , through: :users
  has_many :requests, through: :users
  ## -------------------- Validations --------------------- ##
  validates :name, :slug, :email, :status, presence: true
  ## --------------------- Callbacks ---------------------- ##
  ## ------------------- Class Methods -------------------- ##
  ## ---------------------- Methods ----------------------- ##
end

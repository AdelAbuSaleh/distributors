# frozen_string_literal: true

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
  extend Enumerize
  # include RequestPresenter
  ## ----------------------- Scopes ----------------------- ##
  ## --------------------- Constants ---------------------- ##
  ## ----------------------- Enums ------------------------ ##
  enumerize :name, in: {
    immediate_charging: 0,
    cash_deposit: 1,
    charge_cards: 2
  }, default: 1, scope: true, predicates: true

  enumerize :request_type, in: {
    mtn_credit: 0,
    spafon_credit: 1,
    yemen_mobile_credit: 2,
    cash_deposit: 3
  }, scope: true, predicates: true

  enumerize :status, in: {
    was_repaid: 0,
    not_paid: 1
  }, default: 1, scope: true, predicates: true
  ## -------------------- Associations -------------------- ##
  belongs_to :user
  belongs_to :provider
  ## -------------------- Validations --------------------- ##
  validates :user, presence: true
  validates :provider, presence: true
  validates :request_type, presence: true
  validates :quantity, presence: true, numericality: { greater_than: 0 }, if: (->(r) { r.charge_cards? })
  validates :units_number, presence: true, if: (->(r) { r.immediate_charging? })
  validates :status, presence: true
  ## --------------------- Callbacks ---------------------- ##
  ## ------------------- Class Methods -------------------- ##
  ## ---------------------- Methods ----------------------- ##
  delegate :id, :orgnaization_id, :orgnaization_slug, :orgnaization_name,
           :orgnaization_email,
           to: :user, prefix: true, allow_nil: true
end

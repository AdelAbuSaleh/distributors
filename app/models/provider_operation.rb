# frozen_string_literal: true

# == Schema Information
#
# Table name: provider_operations
#
#  id              :bigint           not null, primary key
#  orgnaization_id :bigint           not null
#  provider_id     :bigint           not null
#  name            :integer
#  operation_type  :integer
#  units_number    :integer
#  cost            :float            default(0.0)
#  discount        :float            default(0.0)
#  amount_paid     :float            default(0.0)
#  remaining       :float            default(0.0)
#  total           :float            default(0.0)
#  status          :integer
#  description     :text
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class ProviderOperation < ApplicationRecord
  # include ProviderOperationPresenter
  extend Enumerize
  ## -------------------- Requirements -------------------- ##
  ## ----------------------- Scopes ----------------------- ##
  ## --------------------- Constants ---------------------- ##
  ## ----------------------- Enums ------------------------ ##
  enumerize :name, in: {
    immediate_charging: 0,
    cash_deposit: 1,
    charge_cards: 2
  }, default: 1, scope: true, predicates: true

  enumerize :operation_type, in: {
    mtn_credit: 0,
    spafon_credit: 1,
    yemen_mobile_credit: 2
  }, scope: true, predicates: true

  enumerize :status, in: {
    was_repaid: 0,
    not_paid: 1
  }, default: 1, scope: true, predicates: true
  ## -------------------- Associations -------------------- ##
  belongs_to :orgnaization
  belongs_to :provider
  ## -------------------- Validations --------------------- ##
  validates :provider, presence: true
  validates :orgnaization, presence: true
  validates :operation_type, presence: true, unless: (->(e) { e.cash_deposit? })
  # validates :quantity, presence: true, numericality: { greater_than: 0 }, if: (->(e) { e.charge_cards? })
  validates :units_number, presence: true, if: (->(e) { e.immediate_charging? })
  validates :status, presence: true
  validates :cost, presence: true
  ## --------------------- Callbacks ---------------------- ##
  before_validation :set_total, :set_remaining, :set_status
  ## ------------------- Class Methods -------------------- ##
  ## ---------------------- Methods ----------------------- ##
  def set_total
    self.discount = discount || 0
    self.total = cost.to_f - discount.to_f
  end

  def set_remaining
    self.remaining = total.to_f - amount_paid.to_f
  end

  def set_status
    self.status = 'was_repaid' if amount_paid == total
  end
end

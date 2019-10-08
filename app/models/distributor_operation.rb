# frozen_string_literal: true

# == Schema Information
#
# Table name: distributor_operations
#
#  id             :bigint           not null, primary key
#  name           :string
#  operation_type :integer          not null
#  quantity       :integer          not null
#  units_number   :integer
#  cost           :float            not null
#  total          :float            not null
#  description    :text
#  opration_date  :datetime         not null
#  status         :integer          not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  invoice_id     :bigint
#

class DistributorOperation < ApplicationRecord
  ## -------------------- Requirements -------------------- ##
  extend Enumerize
  ## ----------------------- Scopes ----------------------- ##
  ## --------------------- Constants ---------------------- ##
  ## ----------------------- Enums ------------------------ ##
  enumerize :operation_type, in: {
    mtn_credit: 0,
    spafon_credit: 1,
    yemen_mobile_credit: 2,
    cash_deposit: 3
  }, default: 1, scope: true, predicates: true

  enumerize :status, in: {
    was_repaid: 0,
    not_paid: 1
  }, default: 1, scope: true, predicates: true
  ## -------------------- Associations -------------------- ##
  belongs_to :user
  belongs_to :call_center
  ## -------------------- Validations --------------------- ##
  # validates :user, presence: true
  # validates :call_center, presence: true
  validates :operation_type, presence: true
  validates :quantity, presence: true
  validates :units_number, presence: true, unless: (->(e) { e.cash_deposit? })
  validates :opration_date, presence: true
  validates :status, presence: true
  validates :cost, presence: true
  ## --------------------- Callbacks ---------------------- ##
  before_validation :set_total
  ## ------------------- Class Methods -------------------- ##
  ## ---------------------- Methods ----------------------- ##
  def set_total
    self.total = cost
  end
end

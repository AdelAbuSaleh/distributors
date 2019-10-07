# == Schema Information
#
# Table name: invoices
#
#  id                              :bigint           not null, primary key
#  ref                             :string
#  description                     :text
#  invoices_date                   :date
#  invoices_time                   :time
#  user_id                         :bigint           not null
#  call_center_id                  :bigint           not null
#  invoice_type                    :integer
#  total                           :float
#  discount                        :float
#  net                             :float
#  remaining_from_previous_invoice :float
#  amount_paid                     :float
#  amount_not_paid                 :float
#  remaining_amount                :float
#  created_at                      :datetime         not null
#  updated_at                      :datetime         not null
#

class Invoice < ApplicationRecord
  ## -------------------- Requirements -------------------- ##
  ## ----------------------- Scopes ----------------------- ##
  ## --------------------- Constants ---------------------- ##
  ## ----------------------- Enums ------------------------ ##
  ## -------------------- Associations -------------------- ##
  belongs_to :user
  belongs_to :call_center
  has_many :distributor_operations
  ## -------------------- Validations --------------------- ##
  validates :invoices_date, presence: true
  # validates :invoices_time, presence: true
  validates :ref, presence: true
  # validates :user, :call_center
  ## --------------------- Callbacks ---------------------- ##
  ## ------------------- Class Methods -------------------- ##
  ## ---------------------- Methods ----------------------- ##
end

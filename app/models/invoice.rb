class Invoice < ApplicationRecord
  ## -------------------- Requirements -------------------- ##
  extend Enumerize
  ## ----------------------- Scopes ----------------------- ##
  ## --------------------- Constants ---------------------- ##
  ## ----------------------- Enums ------------------------ ##
  enumerize :status, in: {
    active: 1,
    inactive: 2
  }, default: 1, scope: true, predicates: true

  enumerize :currency_type, in: {
    yr: 1,
    sr: 2
  }, default: 1, scope: true, predicates: true

  enumerize :invoice_type, in: {
    cash: 1,
    term: 2
  }, default: 1, scope: true, predicates: true

  ## -------------------- Associations -------------------- ##
  belongs_to :orgnaization
  has_many :invoice_info
  ## -------------------- Validations --------------------- ##
  validates :orgnaization, 
            :name, 
            :invoice_type, 
            :invoice_number, 
            :amount_paid,
            :remaining,
            :total_cost,
            :status,
            :date,
            :address,
            :description, presence: true
  ## --------------------- Callbacks ---------------------- ##
  ## ------------------- Class Methods -------------------- ##
  ## ---------------------- Methods ----------------------- ##
end


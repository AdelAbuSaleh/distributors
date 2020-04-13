class InvoiceInfo < ApplicationRecord
  ## -------------------- Requirements -------------------- ##
  extend Enumerize
  ## ----------------------- Scopes ----------------------- ##
  ## --------------------- Constants ---------------------- ##
  ## ----------------------- Enums ------------------------ ##
  ## -------------------- Associations -------------------- ##
  belongs_to :invoice
  ## -------------------- Validations --------------------- ##
  validates :description, 
            :quantity,
            :price_of_one,
            :total_cost,
            presence: true
  ## --------------------- Callbacks ---------------------- ##
  ## ------------------- Class Methods -------------------- ##
  ## ---------------------- Methods ----------------------- ##
end


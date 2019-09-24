# frozen_string_literal: true

class DasbordDistributorOperations
  include Interactor
  delegate :user, :organization, :body, to: :context

  before do
    context.organization = context.collection
    # return context.fail!(error: I18n.t('error')) unless context.user
  end

  def call
    context.body = body
  end

  def distributor_operations(current_orgnaization)
    current_orgnaization.distributor_operations
  end

  ## ...... quantity_operations_not_paid ......##

  def quantity_operations_not_paid(current_orgnaization)
    current_orgnaization.distributor_operations.with_status(:not_paid).pluck(:quantity).sum
    # operations = DistributorOperation.joins(:user).where(user_id: @users_distributors.ids)
    # body(operations)
  end
  ## ...... total_operations_not_paid ......##

  def total_operations_not_paid(current_orgnaization)
    current_orgnaization.distributor_operations.with_status(:not_paid).pluck(:total).sum
  end
  ## ...... operations_whit_status_not_paid ......##

  def operations_whit_status_not_paid(current_orgnaization)
    current_orgnaization.distributor_operations.with_status(:not_paid).count
  end

  ## ...... operations_whit_status_paid ......##

  def operations_whit_status_paid(current_orgnaization)
    current_orgnaization.distributor_operations.with_status(:was_repaid).count
  end
  ## ...... ....... ......##

  def body
    organization.all.map do |current_orgnaization|
      {
        organization_name: current_orgnaization.name,
        quantity_operations_not_paid: quantity_operations_not_paid(current_orgnaization),
        total_operations_not_paid: total_operations_not_paid(current_orgnaization),
        distributor_operations_whit_status_not_paid: operations_whit_status_not_paid(current_orgnaization),
        distributor_operations_whit_status_paid: operations_whit_status_paid(current_orgnaization)
      }
    end
  end
end

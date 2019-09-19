class DasbordDistributorOperations
  include Interactor
  delegate :user, :body, to: :context

  before do
    debugger
    context.user = context.current_user
    context.organization = context.current_organization
    context.distributor_operations = context.user.distributor_operations if context.user.role.eql?('distributor')
    return context.fail!(error: I18n.t('The')) unless context.user
  end

  def call
    debugger
    if context.user.role.eql?('super_admin')
      context.body = super_admin_reprts
    elsif context.user.role.eql?('admin')
      context.body = admin_reprts
    elsif context.user.role.eql?('distributor')
      context.body = distributor_reprts
    else context.user.role.eql?('employee')
      context.body = employee_reprts
    end
  end

  ## ...... distributor_operations ......##
  def super_admin_reprts
    debugger
    users_distributors = User.with_role(:distributor).includes(:call_centers)
    distributors_oprations = users_distributors.map(&:distributor_operations)
  end
  ## ...... distributor_operations ......##
  def admin_reprts
    return unless context.user.distributor?

    context.organization = context.current_organization
    operations = context.user.distributor_operations
    {
      seller_name: context.user.full_name,
      organization_name: context.organization.name,
      quantity_operations_not_paid: operations.with_status(:not_paid).pluck(:quantity).sum,
      total_operations_not_paid: operations.with_status(:not_paid).pluck(:total).sum,
      distributor_operations_whit_status_not_paid: operations.with_status(:not_paid).count,
      distributor_operations_whit_status_paid: operations.with_status(:was_repaid).count
    }
  end
  ## ...... distributor_operations ......##
  def distributor_reprts
    return unless context.user.distributor?

    context.organization = context.current_organization
    operations = context.user.distributor_operations
    {
      seller_name: context.user.full_name,
      organization_name: context.organization.name,
      quantity_operations_not_paid: operations.with_status(:not_paid).pluck(:quantity).sum,
      total_operations_not_paid: operations.with_status(:not_paid).pluck(:total).sum,
      distributor_operations_whit_status_not_paid: operations.with_status(:not_paid).count,
      distributor_operations_whit_status_paid: operations.with_status(:was_repaid).count
    }
  end

  ## ...... distributor_operations ......##
  def employee_reprts
    return unless context.user.distributor?

    context.organization = context.current_organization
    operations = context.user.distributor_operations
    {
      seller_name: context.user.full_name,
      organization_name: context.organization.name,
      quantity_operations_not_paid: operations.with_status(:not_paid).pluck(:quantity).sum,
      total_operations_not_paid: operations.with_status(:not_paid).pluck(:total).sum,
      distributor_operations_whit_status_not_paid: operations.with_status(:not_paid).count,
      distributor_operations_whit_status_paid: operations.with_status(:was_repaid).count
    }
  end

  def body
    {
      distributor_operations: distributor_operations
    }
  end
end
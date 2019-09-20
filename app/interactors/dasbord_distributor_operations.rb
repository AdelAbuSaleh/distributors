class DasbordDistributorOperations
  include Interactor
  delegate :user, :body, to: :context

  before do
    context.user = context.current_user
    context.users_distributors = set_users_distributors
    context.organization = context.current_organization
    # context.operations = context.users_distributors.distributor_operations if context.user.role.eql?('distributor')
    return context.fail!(error: I18n.t('The')) unless context.user
  end

  def call
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

  def set_users_distributors
    @users_distributors ||= User.with_role(:distributor).includes(:call_centers)
  end
  
  ## ...... super_admin_reprts ......##
  def super_admin_reprts
    context.users_distributors.map(&:distributor_operations).flatten
  end
  ## ...... admin_reprts ......##
  def admin_reprts
    context.operations = context.organization.users.map(&:distributor_operations).flatten
    {
      seller_name: context.user.full_name,
      organization_name: context.organization.name,
      quantity_operations_not_paid: context.operations.select {|e| e.status == "was_repaid"}.pluck(:quantity).sum,
      total_operations_not_paid: context.operations.select {|e| e.status == "not_paid"}.pluck(:total).sum,
      distributor_operations_whit_status_not_paid:  context.operations.select {|e| e.status == "not_paid"}.count,
      distributor_operations_whit_status_paid: context.operations.select {|e| e.status == "was_repaid"}.count
    }
  end
  ## ...... distributor_reprts ......##
  def distributor_reprts
    {
      organization_name: context.organization.name,
      quantity_operations_not_paid: operations.with_status(:not_paid).pluck(:quantity).sum,
      total_operations_not_paid: operations.with_status(:not_paid).pluck(:total).sum,
      distributor_operations_whit_status_not_paid: operations.with_status(:not_paid).count,
      distributor_operations_whit_status_paid: operations.with_status(:was_repaid).count
    }
  end

  ## ...... employee_reprts ......##
  def employee_reprts
    {
      seller_name: context.user.full_name,
      organization_name: context.organization.name,
      quantity_operations_not_paid: operations.with_status(:not_paid).pluck(:quantity).sum,
      total_operations_not_paid: operations.with_status(:not_paid).pluck(:total).sum,
      distributor_operations_whit_status_not_paid: operations.with_status(:not_paid).count,
      distributor_operations_whit_status_paid: operations.with_status(:was_repaid).count
    }
  end
end
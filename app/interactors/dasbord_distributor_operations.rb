# frozen_string_literal: true

class DasbordDistributorOperations
  include Interactor
  delegate :user, :body, to: :context

  before do
    context.users_distributors = users_distributors
    return context.fail!(error: I18n.t('error')) unless context.user
  end

  def call
    context.body = if context.user.role.eql?('super_admin')
                     super_admin_reports
                   elsif context.user.role.eql?('admin')
                     admin_reports
                   elsif context.user.role.eql?('distributor')
                     distributor_reports
                   else
                     employee_reports
                   end
  end

  def users_distributors
    @users_distributors ||= User.where(role: 'distributor')
  end

  ## ...... super_admin_reprts ......##

  def super_admin_reports
    # operations = @users_distributors.map(&:distributor_operations).flatten.uniq
    operations = DistributorOperation.joins(:user).where(user_id: @users_distributors.ids)
    body(operations)
  end
  ## ...... admin_reprts ......##

  def admin_reports
    operations = DistributorOperation.joins(:user).where(user_id: context.organization.users.ids)
    body(operations)
  end
  ## ...... distributor_reprts ......##

  def distributor_reports
    operations = context.user.distributor_operations
    body(operations)
  end

  ## ...... employee_reprts ......##

  def employee_reports
    operations = DistributorOperation.joins(:user).where(user_id: context.organization.users.ids)
    body(operations)
  end
  ## ...... ....... ......##

  def body(operations)
    {
      organization_name: context.organization.name,
      quantity_operations_not_paid: operations.with_status(:not_paid).pluck(:quantity).sum,
      total_operations_not_paid: operations.with_status(:not_paid).pluck(:total).sum,
      distributor_operations_whit_status_not_paid: operations.with_status(:not_paid).count,
      distributor_operations_whit_status_paid: operations.with_status(:was_repaid).count
    }
  end
end

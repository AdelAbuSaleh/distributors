# frozen_string_literal: true

class Power
  include Consul::Power

  # attr_reader :current_user

  def initialize(current_user, current_organization)
    @current_user = current_user
    @current_organization = current_organization
  end

  def user?
    @current_user.present?
  end

  # get the role form current users
  def role
    return unless user?

    @current_user.role.to_s
  end

  def super_admin?
    true if role.eql?('super_admin')
  end

  def admin?
    true if role.eql?('admin')
  end

  def employee?
    true if role.eql?('employee')
  end


  # Generate powers for all tables and by default prevent them all from access
  ActiveRecord::Base.connection.tables.map(&:to_sym) - %i[schema_migrations ar_internal_metadata].each do |model|
    power model do
      false
    end
  end

  ######################## V1::UsersController #######################

  power :users_index, :users_show do
    return User if super_admin?
    return @current_organization.users if admin?

    powerless!
  end

  power :creatable_users, :updatable_users do
    return User if super_admin? || admin?

    powerless!
  end

  power :destroyable_users do
    return User if super_admin?

    false
  end


  power :sessions do
    true
  end

  power :static_pages do
    true
  end

  power :call_centers do
    true
  end
end

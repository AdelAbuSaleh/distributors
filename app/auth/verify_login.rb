# frozen_string_literal: true

# Validate user access
class VerifyLogin
  attr_reader :params

  def self.login(params)
    new(params).authenticate!
  end

  def initialize(params)
    @params = params
  end

  def authenticate!
    object = find_provider || (organization.present? && find_user)
    return false if object.blank?

    object.authenticate(params[:password])
  end

  def find_provider
    return if params[:slug].present?

    @find_provider ||= Provider.find_by(email: email_downcase)
  end

  def find_user
    @find_user ||= organization.users.find_by(email: email_downcase)
  end

  def organization
    @organization ||= Orgnaization.find_by(slug: params[:slug])
  end

  def email_downcase
    params[:email]&.downcase
  end
end

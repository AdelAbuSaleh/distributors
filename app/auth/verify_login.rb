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
    return false if user.blank? || organization.blank?
    user.authenticate(params[:password]) ? user : false
  end

  def user
    return false unless organization
    @user ||= organization.users.find_by('email =:login OR user_name =:login', login: params[:login]&.downcase)
  end

  def organization
    @organization ||= Orgnaization.find_by(slug: params[:slug])
  end
end

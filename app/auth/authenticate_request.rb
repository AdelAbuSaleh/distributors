# frozen_string_literal: true

class AuthenticateRequest
  attr_reader :token

  def self.get(token = {})
    new(token).call
  end

  def initialize(token = {})
    @token = token
    # @model = model
  end

  # Service entry point - return valid user object
  def call
    {
      user: user,
      email: decoded_auth_token['email'],
      orgnaization_id: decoded_auth_token['orgnaization_id'],
      slug: decoded_auth_token['slug']
    }
  end

  private

  def user
    return @user ||= User.find(decoded_auth_token['id']) if decoded_user?

    @provider ||= Provider.find(decoded_auth_token['id']) if decoded_provider?

    # handle user not found
  rescue ActiveRecord::RecordNotFound
    # raise custom error
    raise(CustomException::AuthUserNotFound, 'Authorizated user not exist')
  end

  # decode authentication token
  def decoded_auth_token
    @decoded_auth_token ||= JsonWebToken.decode(auth_token)
  end

  def decoded_user?
    decoded_auth_token && decoded_auth_token['slug'].present?
  end

  def decoded_provider?
    decoded_auth_token && decoded_auth_token['slug'].nil?
  end

  # check for auth_token in `Authorization` header
  def auth_token
    return token if token.present?

    raise(CustomException::MissingToken, 'token is missing')
  end
end

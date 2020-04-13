# frozen_string_literal: true

# Authinticat Users
module V1::SessionsHelper
  def authorization(token)
    session[:token] = token
  end

  # Returns the current logged-in user (if any).
  def current_user
    @current_user ||= @token[:user] if valid_token?
  end

  # Returns the current logged-in user (if any).
  def current_organization
    @current_organization ||= @token[:orgnaization] if valid_token?
  end

  # Returns true if the user is logged in, false otherwise.
  def logged_in?
    !current_user.nil?
  end

  # decode authentication token
  def valid_token?
    return unless session[:token]

    @token ||= AuthenticateRequest.get(session[:token])
  end

  # Logs out the current user.
  def log_out
    session.delete(:token)
    @current_user = nil
  end
end

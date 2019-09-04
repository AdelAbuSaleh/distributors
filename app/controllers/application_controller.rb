# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery unless: -> { request.format.json? }

  include V1::SessionsHelper

  before_action :validate_token!

  # include ActionController::MimeResponds
  # include Consul::Controller
  # require_power_check

  # current_power do
  #   Power.new(current_user)
  # end

  def validate_token!
    return redirect_to root_url if session[:token].nil?

    @token = AuthenticateRequest.get(User, session[:token])
    flash[:error] = 'Invalid Authorization!' unless @token[:user]
    redirect_to(root_url) && return if @token[:user].nil?
    set_curret_user
  end

  def set_curret_user
    @current_user = @token[:user]
  end
end

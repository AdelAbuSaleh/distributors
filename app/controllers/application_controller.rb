# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery unless: -> { request.format.json? }

  include V1::SessionsHelper
  include Consul::Controller

  require_power_check
  before_action :validate_token!
  around_action :set_current_user
  attr_accessor :current_user, :current_organization
  # include ActionController::MimeResponds

  current_power do
    Power.new(@current_user, @current_organization)
  end

  def validate_token!
    return redirect_to root_url if session[:token].nil?

    @token = AuthenticateRequest.get(session[:token])
    flash[:error] = 'Invalid Authorization!' unless @token[:user]
    redirect_to(root_url) && return if @token[:user].nil?
    # set_curret_user_with_access
  end

  def set_curret_user_with_access
    @current_user = @token[:user]
    @current_organization = CallCenter.find(@token[:orgnization_id])
  end

  def set_current_user
    Current.user = @current_user
    yield
  ensure
    # to address the thread variable leak issues in Puma/Thin webserver
    Current.user = @current_user
    # Current.user = nil
  end
end

# frozen_string_literal: true

class V1::SessionsController < ApplicationController
  skip_before_action :validate_token!#, only: :create
  power :sessions

  def new; end

  def create
    # return flash.now[:danger] = 'Missing params' if missing_params!(:email, :password)
    user = VerifyLogin.login(login_params)
    # return render_bad_request(message: I18n.t('errors.sessions.1303')) unless user
    # return flash.now[:danger] = 'Invalid login' unless user

    # render_success(message: I18n.t('sessions.login_successfully'), data: data)
    ensure_login user
  end

  def destroy
    log_out
    redirect_to root_url
  end

  def ensure_login(user)
    if user.present?
      data = { user: user, orgnaization: user.try(:orgnaization), token: generate_token(user) }
      flash[:success] = 'Welcome to the Rahma-app!'
      authorization(data)
      redirect_to root_url
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  # Session Meta Payload (token )
  # Generate user token
  def generate_token(user)
    payload =
      {
        id: user.id,
        email: user.email,
        orgnaization_id: user.try(:orgnaization)&.id,
        slug: user.try(:orgnaization)&.slug
      }
    JsonWebToken.encode(payload, 72.hours.from_now)
  end

  # Whitelist parameters
  def login_params
    params.require(:session).permit(:email, :slug, :password)#.to_h.symbolize_keys
  end
end

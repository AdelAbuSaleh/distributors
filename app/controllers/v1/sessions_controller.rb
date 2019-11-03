# frozen_string_literal: true

class V1::SessionsController < ApplicationController
  skip_before_action :validate_token! # , only: :create
  power :sessions

  def new; end

  def create
    user = VerifyLogin.login(login_params)
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

  def destroy
    log_out
    redirect_to root_url
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
    params.require(:session).permit(:email, :slug, :password)
  end
end

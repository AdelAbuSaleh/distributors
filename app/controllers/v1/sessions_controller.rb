# frozen_string_literal: true

class V1::SessionsController < ApplicationController
  skip_before_action :validate_token! # , only: :create
  power :sessions

  def new; end

  def create
    user = VerifyLogin.login(login_params)
    if user.present?
      flash[:success] = 'Welcome to the Rahma-app!'
      authorization(generate_token(user))
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
        orgnaization_id: user.orgnaization_id,
        slug: user.orgnaization.slug
      }
    JsonWebToken.encode(payload, 72.hours.from_now)
  end

  # Whitelist parameters
  def login_params
    params.require(:session).permit(:login, :slug, :password)
  end
end

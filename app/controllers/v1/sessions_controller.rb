# frozen_string_literal: true

class V1::SessionsController < ApplicationController
  skip_before_action :validate_token!
  power :sessions
  def new; end

  def create
    call_center = CallCenter.find_by(slag: login_params[:slag])
    return flash.now[:danger] = 'Invalid login' unless call_center

    user_and_org = User.login(login_params[:email], login_params[:password], call_center)
    ensure_login user_and_org
  end

  def destroy
    log_out
    redirect_to root_url
  end

  def ensure_login(user_and_orgnization)
    if user_and_orgnization.present?
      data = { token: generate_token(user_and_orgnization) }
      flash[:success] = 'Welcome to the Rahma-app!'
      log_in data
      redirect_to root_url
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  # Session Meta Payload (token )
  def generate_token(user_and_orgnization)
    login_payload =
      {
        id: user_and_orgnization[:user].id,
        user_name: user_and_orgnization[:user].user_name,
        role: user_and_orgnization[:user].role,
        email: user_and_orgnization[:user].email,
        orgnization_id: user_and_orgnization[:orgnaization].id
      }

    JsonWebToken.encode(login_payload, 8.hours.from_now)
  end

  def login_params
    params.require(:session).permit(:email, :slag, :password).to_h.symbolize_keys
  end
end

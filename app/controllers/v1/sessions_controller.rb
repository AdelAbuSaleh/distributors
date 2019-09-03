class V1::SessionsController < ApplicationController

  def new; end

  def create
    user = User.login login_params
    ensure_login user
  end

  def destroy
    log_out
    redirect_to root_url
  end

  def ensure_login(user)
    if user.present?
      data = { token: generate_token(user) }
      flash[:success] = 'Welcome to the Rahma-app!'
      log_in data
      redirect_to root_url
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  # Session Meta Payload (token )
  def generate_token(user)
    JsonWebToken.encode(user.login_payload, 8.hours.from_now)
  end

  def login_params
    params.require(:session).permit(:email, :password).to_h.symbolize_keys
  end
end

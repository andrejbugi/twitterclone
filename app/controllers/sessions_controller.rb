class SessionsController < ApplicationController
  def new
    session_notice(:warning, 'Already logged in') if logged_in?

    @user = User.new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)

    if user&.authenticate(params[:session][:password])
      log_in(user)
      redirect_to user
    else
      flash.now[:danger] = 'Wrong email or password'
      render :new
    end
  end

  def destroy
    log_out
    redirect_to root_path
  end
end

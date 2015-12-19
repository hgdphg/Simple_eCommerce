class SessionsController < ApplicationController
  skip_before_action :authorize
  def new
    id = session[:user_id]
    if id
      redirect_to admin_url
    end
  end

  def create
    user = User.find_by(username: params[:username])
    if user and user.authenticate(params[:password])
      session[:user_id] = user.id
      session[:username] = user.username
      redirect_to admin_url
    else
      redirect_to login_url, alert: "Invalid username or password"
    end
  end

  def destroy
    session[:user_id] = nil
    session[:username] = nil
    redirect_to store_url, notice: "Logged out"
  end
end

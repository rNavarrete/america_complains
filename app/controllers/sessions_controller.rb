class SessionsController < ApplicationController

  def new

  end

  def create
    if data = request.env["omniauth.auth"]
      user = User.find_or_create_by_auth(data)
      session[:user_id] = user.id
      flash[:notice] = "You have been successfully logged in."
      redirect_to root_path
    else
      if user = User.authenticate(params[:email], params[:password])
        session[:user_id] = user.id
        flash[:notice] = "You have been logged in."
        redirect_to root_path
      else
        flash[:alert] = "There was a problem logging you in."
        redirect_to log_in_path
      end
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "You have been loggged out successfully"
    redirect_to "/"
  end
end
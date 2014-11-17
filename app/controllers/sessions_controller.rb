class SessionsController < ApplicationController

  def new


  end

  def create
    user = User.authenticate(email: params[:email], password: params[:password])
    if user
      flash[:notice] = "You have been logged in."
      session[:user_id] = user.id
      redirect_to "/"
    else
      flash[:alert] = "There was a problem logging you in."
      redirect_to log_in_path
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "You have been loggged out successfully"
    redirect_to "/"
  end
end
class SessionsController < ApplicationController

  def new


  end

  def create
    if data = request.env["omniauth.auth"]
      user = User.find_or_create_by_auth(data)
      session[:user_id] = user.id
      flash[:notice] = "You have been successfully logged in."
      redirect_to root_path
    elsif params[:email]
      if user = User.authenticate(email: params[:email], password: params[:password])
      flash[:notice] = "You have been successfully logged in."
      end
    end
  end




    # user = User.authenticate(email: params[:email], password: params[:password])
    # if user
    #   flash[:notice] = "You have been logged in."
    #   session[:user_id] = user.id
    #   redirect_to "/"
    # else
    #   flash[:alert] = "There was a problem logging you in."
    #   redirect_to log_in_path
    # end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "You have been loggged out successfully"
    redirect_to "/"
  end
end
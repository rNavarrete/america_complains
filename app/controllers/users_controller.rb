class UsersController < ApplicationController

  def create
    user = User.new(user_params)
    if user.save
      flash[:notice] = "User Created Successfully."
      redirect_to "/"
      session[:user_id] = user.id
      SignUpMailer.welcome_email(user).deliver
    else
      flash[:alert] = "There was a problem creating your account please try again."
      redirect_to :back
    end
  end

  def new
    @user = User.new
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :username, :name)
  end
end

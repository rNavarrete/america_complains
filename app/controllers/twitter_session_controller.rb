class TwitterSessionController < ApplicationController
  def new
    redirect_to "/auth/twitter"
  end

  def create
    auth = request.env["ominiauth.auth"]
    user = User.where(:provider => auth[:provider],
                      :uid => auth[:id].to_s).first || User.create_with_onmiauth(auth)
  end
end
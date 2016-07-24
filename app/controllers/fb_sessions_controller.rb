class FbSessionsController < ApplicationController
  def create
    fb_user = FbUser.from_omniauth(env["omniauth.auth"])
    session[:fb_user_id] = fb_user.id
    redirect_to statuses_path
  end

  def destroy
    session[:fb_user_id] = nil
    redirect_to statuses_path
  end
end

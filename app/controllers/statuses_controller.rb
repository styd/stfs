class StatusesController < ApplicationController
  def index
    unless params[:num]
      params[:num] = "25"
    end
    if params[:query]
      @statuses = Status.search(current_user, params[:num].to_i, params[:query])
      @raw = @statuses
    end
  end

  def current_user
    @current_user ||= FbUser.find(session[:fb_user_id]) if session[:fb_user_id]
  end
  helper_method :current_user
end

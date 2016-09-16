class TweetsController < ApplicationController
  def index
    unless params[:num]
      params[:num] = "25"
    end

    if params[:query]
      @tweets = Tweet.search(params[:query], params[:num].to_i)
      @raw = Tweet.raw
    end
  end
end

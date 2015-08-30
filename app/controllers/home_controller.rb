class HomeController < ApplicationController
  before_filter :authenticate_sign_in!

  def index
    @tweets = TWITTER_CLIENT.user_timeline('stackcommerce', count: 25)
  end

  def tweet_data
    begin
      @tweets = TWITTER_CLIENT.user_timeline(params["handle"], count: 25)
    rescue
      @tweets = nil
    end

    if @tweets
      render json: { html: render_to_string(partial: 'tweet_data', locals: { tweets: @tweets }) }
    else
      render json: { html: render_to_string(partial: 'tweet_error') }
    end
  end
end

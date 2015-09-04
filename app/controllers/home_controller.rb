class HomeController < ApplicationController
  
  before_filter :authenticate_sign_in!
  before_filter :get_tweet_cache_object
 
  def index
    @current_user = current_user

    @tweets = []
  end

  def tweet_data
    begin
      @tweets = @cached_responses.data.fetch([params["handle"]]) do
        get_twitter_object_for(params["handle"])
      end
    rescue
      @tweets = nil
    end

    if @tweets
      render json: @tweets
    else
      render json: { html: render_to_string(partial: 'tweet_error') }
    end
  end

  private

  def get_tweet_cache_object
    @cached_responses ||= TweetCacheWrapper.new(expires_in: 5.minutes)
  end

  def get_twitter_object_for(handle)
    TWITTER_CLIENT.user_timeline(handle, count: 25).map{ |tweet_instance| TweetObjectParser.new(tweet_instance)}
  end
end

class HomeController < ApplicationController
  
  before_filter :authenticate_sign_in!
  before_filter :tweet_cache_object
 
  def index
    @current_user = current_user

    @tweets = []
  end

  def tweet_data
    begin
      @tweets = fetch_or_store_tweet_data_for(params["handle"])
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

  def fetch_or_store_tweet_data_for(handle)
    tweets = tweet_cache_object.data.fetch(handle)
    if tweets.nil?
      tweet_cache_object.data.write(handle, get_twitter_object_for(handle))
      tweets = tweet_cache_object.data.fetch(handle)
    end
    tweets
  end

  def tweet_cache_object
    @cached_responses ||= TweetCacheWrapper.new(expires_in: 5.minutes)
  end

  def get_twitter_object_for(handle)
    TWITTER_CLIENT.user_timeline(handle, count: 25).map do |tweet_instance| 
      TweetObjectParser.new(tweet_instance)
    end
  end
end

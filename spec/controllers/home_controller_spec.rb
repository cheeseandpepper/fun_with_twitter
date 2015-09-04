require 'rails_helper'

RSpec.describe HomeController, type: :controller do

  render_views

  before do
    @user = create(:user)
    sign_in @user
  end

  describe "GET index" do
    it "returns a 200 status code" do
      get :index
      expect(response.code).to eq("200")
    end

    it "restricts non logged in visitors" do
      sign_out @user
      expect(get(:index)).to redirect_to(new_user_session_path)
    end
  end

  describe "POST tweets" do
    
    context "with cached data present" do
      it "fetches the cache data if available" do
        memoized_cache_object = TweetCacheWrapper.new(expires_in: 5.minutes)
        memoized_cache_object.data.write("themetalcoder", tweet_stuff: { tweet1: "hey gang!" })
        
        expect(TweetCacheWrapper).to receive(:new).with(expires_in: 5.minutes)
        post :tweet_data, handle: 'themetalcoder'
      end
    end
    
    context "without cached data present" do
      it "hits the twitter api if there's no cached data" do
        expect(TWITTER_CLIENT).to receive(:user_timeline).with("themetalcoder", {:count=>25})
        post :tweet_data, handle: 'themetalcoder'
      end
    end

  end

end

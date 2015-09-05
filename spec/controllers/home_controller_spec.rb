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
      it "does not hit the twitter api" do
        existing_cache = ActiveSupport::Cache::MemoryStore.new(expires_in: 5.minutes).write('themetalcoder', [{key: "value"}])
        controller.instance_variable_set(:@cached_responses, existing_cache)
        
        expect(TWITTER_CLIENT).to_not receive(:user_timeline)
        post :tweet_data, handle: 'themetalcoder'
      end
    end
    
    context "without cached data present" do
      it "hits the twitter api if there's no cached data" do
        expect(TWITTER_CLIENT).to receive(:user_timeline).with("themetalcoder", {:count=>25})
        post :tweet_data, handle: 'themetalcoder'
      end

      it "stores the newly fetched data into the cache object" do
        fake_tweet = double()
        fake_user  = double()
        allow(fake_tweet).to receive(:text).and_return("text")
        allow(fake_tweet).to receive(:id).and_return(12345)
        allow(fake_tweet).to receive(:user).and_return(fake_user)
        allow(fake_user).to receive(:screen_name).and_return("potus")
        allow(fake_user).to receive(:profile_image_url).and_return("http://www.image.url")
        allow(TWITTER_CLIENT).to receive(:user_timeline).and_return([fake_tweet, fake_tweet])
        post :tweet_data, handle: 'potus'
        expect(controller.instance_variable_get(:@cached_responses).data.fetch('potus')).to be_a_kind_of(Array)
      end
    end

  end

end

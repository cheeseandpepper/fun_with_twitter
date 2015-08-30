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
    it "hits the twitter api" do
      expect(TWITTER_CLIENT).to receive(:user_timeline).with("themetalcoder", {:count=>25})
      post :tweets, handle: 'themetalcoder'
    end

    it "shows the @handle" do
    end

    it "shows the tweet message" do
    end

  end

end

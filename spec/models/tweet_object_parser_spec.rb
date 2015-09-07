require 'rails_helper'

describe TweetObjectParser do
  let(:instance) { TweetObjectParser }
  
  describe ".new" do
    it "returns an object with the correct, parsed data" do
      mock_object      = double()
      mock_user_object = double()
      
      allow(mock_object).to receive(:user) { mock_user_object }
      
      allow(mock_user_object).to receive(:screen_name            ) { 'justinbieber' }
      allow(mock_user_object).to receive(:followers_count        ) { 234            }
      allow(mock_user_object).to receive(:profile_image_url_https) { 'https://pbs.twimg.com/profile_images/637229465152581632/rHZ0lrIJ_normal.jpg' }
      
      allow(mock_object).to receive(:id            ) { 639921861241864193 }
      allow(mock_object).to receive(:favorite_count) { 123                }
      allow(mock_object).to receive(:retweet_count ) { 234                }
      allow(mock_object).to receive(:text          ) { "@billboard that's because they are the best. Stuck with me. Love my #beliebers" }

      expect(instance.new(mock_object).data).to eq(expected_object)
    end
  end

  private

  def expected_object
    {
      image_url:       "https://pbs.twimg.com/profile_images/637229465152581632/rHZ0lrIJ_normal.jpg",
      screen_name:     "justinbieber",
      text:            "<a href='http://twitter.com/billboard' target='_blank'>@billboard</a> that's because they are the best. Stuck with me. Love my #beliebers",
      id:              639921861241864193,
      followers_count: 234,
      retweet_count:   234,
      favorite_count:  123
    }
  end
end

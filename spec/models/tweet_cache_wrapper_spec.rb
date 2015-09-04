require 'rails_helper'

describe TweetCacheWrapper do
  
  let(:instance) { TweetCacheWrapper.new(expires_in: 5.minutes) }
  
  describe ".new" do
    it "instantiates a cache object" do
      expect(instance.data).to be_a_kind_of(ActiveSupport::Cache::MemoryStore)
    end

    it "memoizes the object" do
      first_call  = instance.data.write("key",  "value" )
      second_call = instance.data.write("key2", "value2")
      expect(first_call.object_id).to eq(second_call.object_id) 
    end

  end

end

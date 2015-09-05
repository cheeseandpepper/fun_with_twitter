class TweetCacheWrapper
  
  attr_accessor :data

  def initialize(options={})
    @data = ActiveSupport::Cache::MemoryStore.new(options)
  end

end

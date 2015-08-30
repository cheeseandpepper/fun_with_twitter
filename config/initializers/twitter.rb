config_file = Rails.root.join('config', 'twitter_credentials.yml').to_s
config_hash = YAML.load(File.read(config_file))["twitter"][Rails.env.to_s]

TWITTER_CLIENT = Twitter::REST::Client.new do |config|
  config.consumer_key        = config_hash['consumer_key'   ]
  config.consumer_secret     = config_hash['consumer_secret']
  config.access_token        = config_hash['access_token'   ]
  config.access_token_secret = config_hash['access_secret'  ]
end

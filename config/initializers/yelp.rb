Yelp.client.configure do |config|
  config.consumer_key =  ENV["YELP_CONSUMER_KEY"]
  config.consumer_secret = ENV["CONFIG_CONSUMER_SECRET"]
  config.token = ENV["CONFIG_TOKEN"]
  config.token_secret = ENV["CONFIG_TOKEN_SECRET"]
end
require 'twitter'

class Tweet < ApplicationRecord
  def self.client
    Twitter::REST::Client.new do |config|
      config.consumer_key = ENV["TF_TWITTER_CONSUMER_KEY"]
      config.consumer_secret = ENV["TF_TWITTER_CONSUMER_SECRET"]
      config.access_token = ENV["TF_TWITTER_ACCESS_TOKEN"]
      config.access_token_secret = ENV["TF_TWITTER_ACCESS_TOKEN_SECRET"]
    end
  end

  @@client = client

  def self.search how_many, query, options = {result_type: 'recent'}
    @@tweets = @@client.search(query, options).take(how_many).collect do |tweet|
      tweet
    end
  end

  def self.raw
    @@raw = @@tweets.collect do |tweet|
      tweet.to_h
    end
  end
end

require 'rails_helper'

describe 'Search results' do
  it 'contain at least 1 tweet' do
    tweets = Tweet.search('google') # search with popular keyword

    expect(tweets.size).to be >= 1
  end
end

describe 'Each tweet' do
  it 'should have key ":text"' do
    tweets = Tweet.search('google') # search with popular keyword

    tweets.each do |tweet|
      expect(tweet.to_h).to include(:text)
    end
  end
end

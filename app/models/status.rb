require 'koala'

class Status < ApplicationRecord
  def self.search current_user, how_many, query, options = {result_type: 'recent'}
    Koala.config.api_version = "v2.0"
    @@client = Koala::Facebook::API.new(current_user.oauth_token)
    profile = @@client.get_object("me")
    friends = @@client.get_connections("me", "friends")
    # @@statuses = @@client.search(query, options).take(how_many).collect do |tweet|
    #   tweet
    # end
  end
end

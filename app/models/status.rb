require 'koala'

class Status < ApplicationRecord
  def self.search current_user, how_many, query
    Koala.config.api_version = "v2.0"
    @@client = Koala::Facebook::API.new(current_user.oauth_token)
    profile = @@client.get_object("me")
    friends = @@client.get_connections("me", "friends")
  end
end

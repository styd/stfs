OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  configure do |config|
    config.path_prefix = '/auth'
  end
  provider :facebook, ENV["FB_APP_ID"].to_s, ENV["FB_APP_SECRET"].to_s, scope: 'user_friends,user_posts'
end

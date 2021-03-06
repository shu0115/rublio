Rails.application.config.middleware.use OmniAuth::Builder do
  # Twitter
  provider :twitter, Settings.twitter_key, Settings.twitter_secret

  # Others
#  provider :developer unless Rails.env.production?
#  provider :twitter, ENV['TWITTER_KEY'], ENV['TWITTER_SECRET']
#  provider :github, ENV['GITHUB_CLIENT_ID'], ENV['GITHUB_SECRET']
#  provider :facebook, ENV['FACEBOOK_APP_ID'], ENV['FACEBOOK_APP_SECRET']
end

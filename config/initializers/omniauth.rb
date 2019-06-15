Rails.application.config.middleware.use OmniAuth::Builder do
    provider :amazon, ENV['CLIENT_ID'], ENV['CLIENT_SECRET']
end
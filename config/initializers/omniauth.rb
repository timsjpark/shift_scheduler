Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_auth2, ENV['CLIENT_ID'], ENV['CLIENT_SECRET'], {
               scope: ['calendar',
               'https://www.googleapis.com/auth/calendar'],
               access_type: 'offline'}
end
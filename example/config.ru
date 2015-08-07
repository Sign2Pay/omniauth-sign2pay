# Sample app for Sign2Pay OAuth2 Strategy
# Make sure to setup the ENV variables CLIENT_ID and CLIENT_SECRET
# Run with "bundle exec rackup"

require 'bundler/setup'
require 'sinatra/base'
require 'omniauth-sign2pay'

class App < Sinatra::Base
  get '/' do
    <<-HTML
    <html>
    <head>
      <title>Sign2Pay Authature Oauth2</title>
    </head>
    <body>
      <form action="/auth/sign2pay" method="get">
      <label for="device_uid">Enter a device_uid</label>
      <input type="text" name="device_uid" placeholder="1111111111111">

      <label for="user_params[identifier]">email:</label>
      <input type="email" name="user_params[identifier]" placeholder="bobloblaw@example.com">

      <label for="user_params[first_name]">first_name:</label>
      <input type="text" name="user_params[first_name]" placeholder="Bob">

      <label for="user_params[last_name]">last_name:</label>
      <input type="text" name="user_params[last_name]" placeholder="Loblaw">

      <label for="user_params[mobile]">mobile:</label>
      <input type="phone" name="user_params[mobile]" placeholder="123456789">

      <button type="submit">Let's go!</button>
      </form>
    </body>
    </html>
    HTML
  end

  get '/auth/:provider/callback' do
    content_type 'application/json'
    MultiJson.encode(request.env['omniauth.auth'])
  end

  get '/auth/failure' do
    content_type 'application/json'
    MultiJson.encode(request.env)
  end
end

use Rack::Session::Cookie, :secret => 'change_me'

# You can specify your scope in your middleware.  If you want.
use OmniAuth::Builder do
  provider :sign2pay, ENV['CLIENT_ID'], ENV['CLIENT_SECRET'], :scope=>'capture'
end

run App.new

require "omniauth-oauth2"

module OmniAuth
  module Strategies
    class Sign2pay < OmniAuth::Strategies::OAuth2

      # args receives parameters from the strategy declaration in client's rack middleware
      option :client_options, {
        :site => "http://sign2pay.dev",
        :authorize_url => "http://sign2pay.dev/oauth/authorize",
        :token_url => "http://sign2pay.dev/oauth/token"
      }

      option :name, "sign2pay"

      uid { request.params['user_id'] }

      info do
        {
          :email => request.params['email']
        }
      end

    end
  end
end

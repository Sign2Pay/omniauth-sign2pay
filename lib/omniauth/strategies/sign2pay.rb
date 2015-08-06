require "omniauth-oauth2"

module OmniAuth
  module Strategies
    class Sign2pay < OmniAuth::Strategies::OAuth2

      # args receives parameters from the strategy declaration in client's rack middleware
      option :client_options, {
        :site => "https://app.sign2pay.com/",
        :authorize_url => "https://app.sign2pay.com/oauth/authorize",
        :token_url => "https://app.sign2pay.com/oauth/token"
      }

      option :name, "sign2pay"

      uid { request.params['identifier'] }

      info do
        {
          :email => request.params['identifier']
        }
      end

    end
  end
end

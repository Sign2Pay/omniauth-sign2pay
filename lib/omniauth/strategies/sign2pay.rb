require "omniauth-oauth2"

module OmniAuth
  module Strategies
    class Sign2pay < OmniAuth::Strategies::OAuth2

      option :authorize_options, [:scope, :device_uid, :user_params]

      option :client_options, {
        :site => "https://app.sign2pay.com/",
        :authorize_url => "https://app.sign2pay.com/oauth/authorize",
        :token_url => "https://app.sign2pay.com/oauth/token"
      }

      option :name, "sign2pay"

      # You can pass +scope+ params to the auth request, if you need to set them dynamically.
      # You can also set these options in the OmniAuth config :authorize_params option.
      #
      # For example: /auth/sign2pay?scope=capture
      def authorize_params
        super.tap do |params|
          options[:authorize_options].each do |key|
            params[key] = request.params[key.to_s] unless [nil, ''].include? request.params[key.to_s]
          end
        end
      end

      def build_access_token
        options.token_params.merge!(:headers => {'Authorization' => basic_auth_header }, :state => (options[:state] || SecureRandom.hex(16)))
        super
      end

      def basic_auth_header
        "Basic " + Base64.strict_encode64("#{options[:client_id]}:#{options[:client_secret]}")
      end

    end
  end
end

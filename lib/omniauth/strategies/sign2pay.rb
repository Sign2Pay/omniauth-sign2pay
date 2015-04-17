require "omniauth"

module OmniAuth
  module Strategies
    class Sign2pay
      include OmniAuth::Strategy

      # args receives parameters from the strategy declaration in client's rack middleware
      args [:client_id, :client_secret, :redirect_uri]

      option :name, "sign2pay"

      # redirect to sign2pay server site for authentication of client
      def request_phase
        redirect :redirect_uri
      end

      # after authentication with sign2pay, redirect to client and send along info about client
      def callback_phase
      end

      uid { request.params['user_id'] }

      info do
        {
          :email => request.params['email']
        }
      end

    end
  end
end

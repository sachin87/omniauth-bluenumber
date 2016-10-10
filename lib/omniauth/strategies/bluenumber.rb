module OmniAuth
  module Strategies
    class Bluenumber < OmniAuth::Strategies::OAuth2
      option :email, :bluenumber

      option :client_options, {
        site: "http://localhost:3000",
        authorize_path: "/oauth/authorize"
      }

      uid do
        raw_info["id"]
      end

      info do
        {name: raw_info["name"], email: 'sachin.y87@gmail.com'}
      end

      def raw_info
        @raw_info ||= {}
      end
    end
  end
end

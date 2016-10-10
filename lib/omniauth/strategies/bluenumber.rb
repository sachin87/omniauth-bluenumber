module OmniAuth
  module Strategies
    class Bluenumber < OmniAuth::Strategies::OAuth2
      option :name, 'bluenumber'

      option :client_options, {
        site: localhost,
        authorize_path: "/oauth/authorize"
      }

      uid do
        raw_info["id"]
      end

      info do
        {name: raw_info["name"], email: email}
      end

      def localhost
        "http://localhost:3000"
      end

      def email
        nil
      end

      def raw_info
        @raw_info ||= {}
      end
    end
  end
end

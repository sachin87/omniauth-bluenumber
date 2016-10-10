module OmniAuth
  module Strategies
    class Bluenumber < OmniAuth::Strategies::OAuth2
      
      option :name, 'bluenumber'

      option :client_options, {
        site: "http://localhost:3000",
        authorize_path: "/oauth/authorize"
      }

      uid do
        raw_info["id"]
      end

      info do
        {email: email, bluenumber: bluenumber,
         username: username, actor_id: actor_id}
      end

      def localhost
        "http://localhost:3000"
      end

      def email
        raw_info['email']
      end

      def bluenumber
        raw_info['bluenumber']
      end

      def username
        raw_info['username']
      end

      def actor_id
        raw_info['ActorID']
      end  

      def raw_info
        @raw_info ||= access_token.get('/gpr/v2/users/user_info').parsed
      rescue ::Errno::ETIMEDOUT
        raise ::Timeout::Error
      end
    end
  end
end

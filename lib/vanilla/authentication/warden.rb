require 'warden'
require 'md5'

module Vanilla
  module Authentication
    class Warden < Base
      def initialize(app)
        super
        ::Warden::Strategies.add(:vanilla, Vanilla::Authentication::Warden::Strategy)
      end

      def authenticated?
        @app.request.env['warden'].authenticated?
      end

      def user
        @app.request.env['warden'].user
      end

      def authenticate!
        @app.request.env['warden'].authenticate!
      end

      def logout
        @app.request.env['warden'].logout
      end

      class Strategy < ::Warden::Strategies::Base
        def valid?
          params["name"] || params["password"]
        end

        def authenticate!
          if env['vanilla.app'].config[:credentials][params["name"]] == MD5.md5(params["password"]).to_s
            # clear these so they don't interfere with the request
            env['vanilla.app'].request.params.delete(:name)
            env['vanilla.app'].request.params.delete(:password)
            success!(params["name"])
          else
            fail! "Sorry, you couldn't be logged in with those details"
          end
        end
      end

      class FailApp
        def call(env)
          [401, {"Content-Type" => "text/html"}, [login_form(env)]]
        end

        private

        def login_form(env)
          env['vanilla.app'].soup["system"].login_template.gsub("MESSAGE", env['warden'].message || "Please log in")
        end
      end
    end
  end
end

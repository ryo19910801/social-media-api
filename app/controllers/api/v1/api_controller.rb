module Api
  module V1
    class ApiController < ApplicationController
      include ActionController::HttpAuthentication::Token::ControllerMethods
      protect_from_forgery
      before_action :authenticate!

      helper_method :current_user

      rescue_from Exception, with: :response_not_found

      def response_bad_request
        render status: 400, json: { status: 400, message: 'Bad Request' }
      end

      def response_not_found
        render status: 404, json: { status: 404, message: "Not Found" }
      end

      private
      def authenticate!
        # Authorization header Token hoge
        authenticate_or_request_with_http_token do |token, options|
          @current_user = User.find_by(auth_token: token)
        end
      end

      def current_user
        @current_user ||= User.find_by(auth_token: request.headers['Authorization'].split[1])
      end
    end
  end
end

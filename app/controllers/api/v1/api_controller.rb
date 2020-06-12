module Api
  module V1
    class ApiController < ApplicationController
      protect_from_forgery

      # 400 Bad Request
      def response_bad_request
        render status: 400, json: { status: 400, message: 'Bad Request' }
      end
    end
  end
end

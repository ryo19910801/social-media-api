module Api
  module V1
    class UsersController < ApiController
      def create
        @user = User.new(user_params)
        if @user.valid?
            @user.save
        else
          response_bad_request and return
        end
      end

      private
      def user_params
        params.require(:user).permit(:name, :self_introduction, :website_url)
      end
    end
  end
end
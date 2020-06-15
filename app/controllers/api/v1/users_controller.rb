module Api
  module V1
    class UsersController < ApiController
      skip_before_action :authenticate!, only: [:create]

      def create
        @user = User.new(create_params)
        if @user.valid?
            @user.save
        else
          response_bad_request and return
        end
      end

      def update
        current_user.update!(update_params)
      end

      private
      def create_params
        params.require(:user).permit(:name, :self_introduction, :website_url, :avatar)
      end

      def update_params
        params.require(:user).permit(:id, :name, :self_introduction, :website_url, :avatar)
      end
    end
  end
end
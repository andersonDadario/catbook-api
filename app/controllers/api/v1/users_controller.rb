module Api
  module V1
    class UsersController < BaseController
        def user_params
            params.require(:user).permit(:nothing)
        end

        def query_params
            params.permit()
        end
    end
  end
end
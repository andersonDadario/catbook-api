module Api
  module V1
    class EndorsementsController < BaseController
        def endorsement_params
            params.require(:endorsement).permit(:skill_id, :user_id)
        end

        def query_params
            params[:user_id] ||= 0
            params.permit(:skill_id, :user_id)
        end
    end
  end
end
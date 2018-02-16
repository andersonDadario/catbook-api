module Api
  module V1
    class SkillsController < BaseController
        def skill_params
            # TODO remove user_id as it will use the id from JWT
            params.require(:skill).permit(:name, :user_id)
        end

        def includes_params
            [:endorsers]
        end

        def left_joins_params
            [:endorsers]
        end

        def group_params
            [:id]
        end

        def order_params
            'COUNT(users.id) DESC'
        end

        def query_params
            params[:user_id] ||= 0
            params.permit(:skill_id, :user_id)
        end
    end
  end
end
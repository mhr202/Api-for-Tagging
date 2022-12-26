module Api
  module V1
    class TopicsController < BaseController
      actions :create

      private

      def permitted_params
        params.require(:campaign_topic).permit(:title, :campaign_id)
      end
    end
  end
end

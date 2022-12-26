module Api
  module V1
    class CommentsController < BaseController
      actions :create

      private

      def permitted_params
        params.require(:comments).permit(:text, :campaign_id, :topic_id)
      end
    end
  end
end

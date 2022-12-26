module Api
  module V1
    class SubTagsController < BaseController
      actions :create

      private

      def permitted_params
        params.require(:sub_tags).permit(:name, :tag_id)
      end
    end
  end
end

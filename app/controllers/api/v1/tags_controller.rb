module Api
  module V1
    class TagsController < BaseController
      actions :create

      private

      def permitted_params
        params.require(:tags).permit(:name)
      end
    end
  end
end

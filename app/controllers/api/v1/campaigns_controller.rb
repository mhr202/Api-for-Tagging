module Api
  module V1
    class CampaignsController < BaseController
      actions :create

      def add_tag
        new_tag ||= resource.taggings.build(permitted_params)

        if new_tag.save
          render json: new_tag, status: :created
        else
          render json: { message: new_tag.errors.full_messages }, status: :unprocessable_entity
        end
      end

      private

      def permitted_params
        params.require(:campaign).permit(:id, :title, :purpose, :duration, :user_id, :tag_id)
      end
    end
  end
end

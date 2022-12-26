require 'rails_helper'
RSpec.describe 'Topic', type: :request do
  before(:each) do
    @campaign = FactoryBot.create(:campaign)
    @topic = FactoryBot.create(:topic)
    @create_comment_url = '/api/v1/comments'
    @campaign_topic_params = {
      comments: {
        campaign_id: @campaign.id,
        topic_id: @topic.id,
        text: Faker::String.random
      }
    }
  end

  describe 'POST /api/v1/comments' do
    context 'when comment params are valid' do
      before do
        post @create_comment_url, params: @campaign_topic_params, as: :json
      end

      it 'returns status 201' do
        expect(response).to have_http_status(:created)
      end
    end

    context 'when comment params are invalid' do
      before { post @create_comment_url }

      it 'returns unathorized status 422' do
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end

    context 'when required params are missing' do
      before do
        @campaign_topic_params = {
          comments: {
            dummy: Faker::Name.name
          }
        }
        post @create_comment_url, params: @campaign_topic_params, as: :json
      end

      it 'returns unathorized status 422' do
        expect(parsed_response['message']).to include('Campaign must exist')
        expect(parsed_response['message']).to include('Topic must exist')
        expect(parsed_response['message']).to include("Text can't be blank")
      end
    end
  end
end

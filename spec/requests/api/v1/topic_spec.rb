require 'rails_helper'
RSpec.describe 'Topic', type: :request do
  before(:each) do
    @campaign = FactoryBot.create(:campaign)
    @create_campaign_topic_url = '/api/v1/topics'
    @campaign_topic_params = {
      campaign_topic: {
        campaign_id: @campaign.id,
        title: 'Campaign Tag'
      }
    }
  end

  describe 'POST /api/v1/topics' do
    context 'when campaign topic params are valid' do
      before do
        post @create_campaign_topic_url, params: @campaign_topic_params, as: :json
      end

      it 'returns status 201' do
        expect(response).to have_http_status(:created)
      end
    end

    context 'when campaign topic params are invalid' do
      before { post @create_campaign_topic_url }

      it 'returns unathorized status 422' do
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end

    context 'when campaign id is missing' do
      before do
        @campaign_topic_params = {
          campaign_topic: {
            title: 'Campaign Tag'
          }
        }
        post @create_campaign_topic_url, params: @campaign_topic_params, as: :json
      end

      it 'returns unathorized status 422' do
        expect(parsed_response['message']).to include('Campaign must exist')
      end
    end
  end
end

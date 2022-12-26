require 'rails_helper'
RSpec.describe 'Campaign', type: :request do
  before(:each) do
    @user = FactoryBot.create(:user)
    @campaign = FactoryBot.create(:campaign)
    @tag = FactoryBot.create(:tag)
    @sub_tag = FactoryBot.create(:sub_tag)

    @create_campaign_url = '/api/v1/campaigns'
    @add_campaign_tag_url = '/api/v1/campaigns/add_tag'

    @campaign_params = {
      campaign: {
        user_id: @user.id,
        title: 'Campaign',
        purpose: 'Test',
        duration: 'within 1 week'
      }
    }

    @campaign_tag_params = {
      campaign: {
        id: @campaign.id,
        tag_id: @tag.id
      }
    }

    @campaign_sub_tag_params = {
      campaign: {
        id: @campaign.id,
        tag_id: @sub_tag.id
      }
    }
  end

  describe 'POST /api/v1/campaigns' do
    context 'when campaign params are valid' do
      before do
        post @create_campaign_url, params: @campaign_params, as: :json
      end

      it 'returns status 201' do
        expect(response).to have_http_status(:created)
      end
    end

    context 'when campaign params are invalid' do
      before { post @create_campaign_url }

      it 'returns unathorized status 422' do
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end

    context 'when campaign duration is invalid' do
      before do
        @campaign_params = {
          campaign: {
            user_id: @user.id,
            title: 'Campaign',
            purpose: 'Test',
            duration: 'abc'
          }
        }
        post @create_campaign_url, params: @campaign_params, as: :json
      end

      it 'returns unathorized status 422' do
        expect(parsed_response['message']).to include('Duration is not included in the list')
      end
    end

    context 'when campaign title is missing' do
      before do
        @campaign_params = {
          campaign: {
            user_id: @user.id,
            purpose: 'Test'
          }
        }
        post @create_campaign_url, params: @campaign_params, as: :json
      end

      it 'returns unathorized status 422' do
        expect(parsed_response['message']).to include("Title can't be blank")
        expect(parsed_response['message']).to include("Duration can't be blank")
      end
    end
  end

  describe 'POST /api/v1/campaigns/add_tag' do
    context 'when campaign tag params are valid' do
      before do
        post @add_campaign_tag_url, params: @campaign_tag_params, as: :json
      end

      it 'returns status 201' do
        expect(response).to have_http_status(:created)
      end
    end

    context 'when campaign tag params are invalid' do
      before { post @add_campaign_tag_url }

      it 'returns unathorized status 422' do
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'POST /api/v1/campaigns/add_tag' do
    context 'when campaign sub tag params are valid' do
      before do
        post @add_campaign_tag_url, params: @campaign_sub_tag_params, as: :json
      end

      it 'returns status 201' do
        expect(response).to have_http_status(:created)
      end
    end

    context 'when campaign tag params are invalid' do
      before { post @add_campaign_tag_url }

      it 'returns unathorized status 422' do
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end

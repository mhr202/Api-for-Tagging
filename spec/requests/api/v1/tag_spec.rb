require 'rails_helper'
RSpec.describe 'Tag', type: :request do
  before(:each) do
    @create_tags_url = '/api/v1/tags'
    @tag_params = {
      tags: {
        name: Faker::Name.name
      }
    }
  end

  describe 'POST /api/v1/tags' do
    context 'when tag params are valid' do
      before do
        post @create_tags_url, params: @tag_params, as: :json
      end

      it 'returns status 201' do
        expect(response).to have_http_status(:created)
      end
    end

    context 'when tag params are invalid' do
      before { post @create_tags_url }

      it 'returns unathorized status 422' do
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end

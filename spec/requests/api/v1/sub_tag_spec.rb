require 'rails_helper'
RSpec.describe 'SubTag', type: :request do
  before(:each) do
    @tag = FactoryBot.create(:tag)
    @create_sub_tags_url = '/api/v1/sub_tags'
    @sub_tag_params = {
      sub_tags: {
        tag_id: @tag.id,
        name: Faker::Name.name
      }
    }
  end

  describe 'POST /api/v1/sub_tags' do
    context 'when sub tag params are valid' do
      before do
        post @create_sub_tags_url, params: @sub_tag_params, as: :json
      end

      it 'returns status 201' do
        expect(response).to have_http_status(:created)
      end
    end

    context 'when sub tag params are invalid' do
      before { post @create_sub_tags_url }

      it 'returns unathorized status 422' do
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end

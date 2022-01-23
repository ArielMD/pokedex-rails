require 'rails_helper'

RSpec.describe 'api/pokedex', type: :request do
  describe 'GET /create' do
    it 'renders a successful response' do
      post '/api/pokedex'
      expect(response).to have_http_status(:accepted)
      expect(response.body).to include('Request Accepted')
    end
  end
end

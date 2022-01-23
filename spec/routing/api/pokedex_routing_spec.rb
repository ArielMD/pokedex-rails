require 'rails_helper'

RSpec.describe Api::PokedexController, type: :routing do
  describe '/pokedex routing' do
    it 'routes to #show' do
      expect(post: '/api/pokedex').to route_to('api/pokedex#create')
    end
  end
end

require 'rails_helper'

RSpec.describe PokedexController, type: :routing do
  describe '/pokedex routing' do
    it 'routes to #index' do
      expect(get: '/pokedex').to route_to('pokedex#index')
    end

    it 'routes to #show' do
      expect(get: '/pokedex/1').to route_to('pokedex#show', id: '1')
    end
  end
end

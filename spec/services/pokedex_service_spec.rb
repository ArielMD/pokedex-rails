require 'rails_helper'

RSpec.describe PokedexService, type: :model do
  before(:each) do
    @pokemon_service = PokedexService.new
  end

  context 'generate_kalos_pokemon' do
    it 'should fetch pokemon api and create them' do
      @pokemon_service.generate_kalos_pokemon
      expect(@pokemon_service.pokemon).to be_a(Array)
      expect(@pokemon_service.pokemon.count).to equal(1)
    end
  end
end

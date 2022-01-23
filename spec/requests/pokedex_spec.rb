require 'rails_helper'

RSpec.describe 'pokedex', type: :request do
  before(:each) do
    @pokemon_repository = PokemonRepository.new
  end

  let(:valid_params) do
    { 'abilities' => ['Espesura'],
      'detail_page_url' => '/el/pokedex/bulbasaur',
      'weight' => 6.9,
      'weakness' => %w[Fuego Psíquico Volador Hielo],
      'number' => '001',
      'height' => 0.7,
      'collectibles_slug' => 'bulbasaur',
      'featured' => 'true',
      'slug' => 'bulbasaur',
      'name' => 'Bulbasaur',
      'thumbnail_alt_text' => 'Bulbasaur',
      'thumbnail_image' => 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/001.png',
      'id' => 1, 'type' => %w[grass poison] }
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      get pokedex_index_url
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      @pokemon_repository.create(valid_params)
      pokemon = @pokemon_repository.show(1)
      get pokedex_path(pokemon)
      expect(response).to be_successful
    end
  end
end

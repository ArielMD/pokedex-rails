require 'rails_helper'

RSpec.describe PokemonRepository, type: :model do
  before(:all) do
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

  context 'with valid params' do
    it 'should list all pokemon with pagination' do
      expect(@pokemon_repository.paginate(1).count).to be(0)
      @pokemon_repository.create(valid_params)
      expect(@pokemon_repository.paginate(1).count).to be(1)
    end

    it 'should return an empty array if pagination number does not exist' do
      expect(@pokemon_repository.paginate(1000).count).to be(0)
    end

    it 'should find a pokemon by id' do
      @pokemon_repository.create(valid_params)
      pokemon_founded = @pokemon_repository.show(1)
      expect(pokemon_founded.id).to eq(1)
      expect(pokemon_founded.name).to eq('Bulbasaur')
    end

    it 'should create a pokemon using valid params' do
      expect do
        @pokemon_repository.create(valid_params)
      end.to change(Pokemon, :count).by(1)
                                    .and change(Ability, :count).by(1)
                                                                .and change(Weakness, :count).by(4)
                                                                                             .and change(Type,
                                                                                                         :count).by(2)
    end
  end

  context 'with invalid params' do
    it 'should not create a pokemon if abilities are missing' do
      valid_params.delete('abilities')
      expect do
        @pokemon_repository.create(valid_params)
      end.to raise_error(NoMethodError)
    end
    it 'should not create a pokemon if types are missing' do
      valid_params.delete('type')
      expect do
        @pokemon_repository.create(valid_params)
      end.to raise_error(NoMethodError)
    end

    it 'should not create a pokemon if weaknesses are missing' do
      valid_params.delete('weakness')
      expect do
        @pokemon_repository.create(valid_params)
      end.to raise_error(NoMethodError)
    end

    it 'should throw error if page param doesnt exist' do
      expect do
        @pokemon_repository.paginate(-2)
      end.to raise_error(RangeError)
    end
  end
end

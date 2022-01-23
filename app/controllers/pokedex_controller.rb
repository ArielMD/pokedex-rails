class PokedexController < ApplicationController
  before_action :set_pokemon_repository, only: %i[index show]

  def index
    @pokemons = @pokemon_repository.all
  end

  def show
    @pokemon = @pokemon_repository.show(params['id'])
  end

  private

  def set_pokemon_repository
    @pokemon_repository = PokemonRepository.new
  end
end

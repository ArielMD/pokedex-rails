class PokedexController < ApplicationController
  before_action :set_pokemon_repository, only: %i[index show]

  def index
    @pokemons = if params[:query]
                  @pokemon_repository.search(params[:query], params[:page])
                else
                  @pokemon_repository.paginate(params[:page])
                end
  end

  def show
    @pokemon = @pokemon_repository.show(params['id'])
  end

  private

  def set_pokemon_repository
    @pokemon_repository = PokemonRepository.new
  end
end

require 'net/http'

class PokedexService
  attr_reader :pokemon

  def initialize
    @url_str = 'https://www.pokemon.com/el/api/pokedex/kalos'
    @pokemon_repository = PokemonRepository.new
  end

  def generate_kalos_pokemon
    @pokemon = get_pokemon
    @pokemon.each do |p|
      poke = p.deep_transform_keys { |key| key.to_s.underscore }
      @pokemon_repository.create(poke)
    end
  end

  private

  def get_pokemon
    uri = URI(@url_str)
    req = Net::HTTP.get(uri)
    res = JSON.parse(req)
  end
end

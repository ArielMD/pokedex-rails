class GeneratePokemonJob < ApplicationJob
  queue_as :default

  def perform
    PokedexService.new.generate_kalos_pokemon
  end
end

class PokemonWeakness < ApplicationRecord
  belongs_to :pokemon
  belongs_to :weakness
end

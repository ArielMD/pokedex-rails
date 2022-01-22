class PokemonRepository
  def all
    Pokemon.all
  end

  def show(id)
    Pokemon.find(id)
  end

  def create(params)
    return if Pokemon.find_by(id: params['id'])

    pokemon = Pokemon.new(pokemon_params(params))
    ActiveRecord::Base.transaction do
      pokemon.abilities = AbilityRepository.new.create_many_abilities(ability_params(params))
      pokemon.types = TypeRepository.new.create_many_types(type_params(params))
      pokemon.weaknesses = WeaknessRepository.new.create_many_weakness(weakness_params(params))
      pokemon.save
    end
  end

  def delete(id)
    User.destroy(id)
  end

  def update(id, pokemon_params)
    pokemon = show(id)
    pokemon.update(pokemon_params)
  end

  private

  def pokemon_params(params)
    copy_params = params.clone
    copy_params.delete('abilities')
    copy_params.delete('weakness')
    copy_params.delete('type')
    copy_params
  end

  def ability_params(params)
    params['abilities']
  end

  def type_params(params)
    params['type']
  end

  def weakness_params(params)
    params['weakness']
  end
end
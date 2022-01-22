class AbilityRepository
  def all
    Ability.all
  end

  def show(id)
    Ability.find(id)
  end

  def create(ability_params)
    ability = Ability.new(ability_params)
    ability.save
  end

  def create_many_abilities(abilities_params = [])
    abilities_params.map do |ability|
      Ability.find_or_create_by(name: ability)
    end
  end

  def delete(id)
    Ability.destroy(id)
  end

  def update(id, ability_params)
    ability = show(id)
    ability.update(ability_params)
  end
end

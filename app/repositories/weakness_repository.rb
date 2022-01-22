class WeaknessRepository
  def all
    Weakness.all
  end

  def show(id)
    Weakness.find(id)
  end

  def create(weakness_params)
    weakness = Weakness.new(weakness_params)
    weakness.save
  end

  def create_many_weakness(weaknesses_params = [])
    weaknesses_params.map do |weakness|
      Weakness.find_or_create_by(name: weakness)
    end
  end

  def delete(id)
    Weakness.destroy(id)
  end

  def update(id, weakness_params)
    weakness = show(id)
    weakness.update(weakness_params)
  end
end

class TypeRepository
  def all
    Type.all
  end

  def show(id)
    Type.find(id)
  end

  def create(type_params)
    type = Type.new(type_params)
    type.save
  end

  def create_many_types(types_params = [])
    types_params.map do |type|
      Type.find_or_create_by(name: type)
    end
  end

  def delete(id)
    Type.destroy(id)
  end

  def update(id, type_params)
    type = show(id)
    type.update(type_params)
  end
end

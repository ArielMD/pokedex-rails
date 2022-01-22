require 'rails_helper'

RSpec.describe TypeRepository, type: :model do
  before(:all) do
    @type_repository = TypeRepository.new
  end

  let(:valid_params) do
    { id: 1, name: 'grass' }
  end

  let(:types) do
    %w[grass poison]
  end

  it 'should list all types' do
    expect(@type_repository.all.count).to be(0)
    expect do
      @type_repository.create(valid_params)
    end.to change(Type, :count).by(1)
  end

  it 'should find a type by id' do
    @type_repository.create(valid_params)
    type_founded = @type_repository.show(1)
    expect(type_founded.id).to eq(1)
    expect(type_founded.name).to eq('grass')
  end

  it 'should create a lot of types using a array' do
    expect do
      @type_repository.create_many_types(types)
    end.to change(Type, :count).by(2)
  end
end

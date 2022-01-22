require 'rails_helper'

RSpec.describe AbilityRepository, type: :model do
  before(:all) do
    @ability_repository = AbilityRepository.new
  end

  let(:valid_params) do
    { id: 1, name: 'fire' }
  end

  let(:abilities) do
    %w[fire water]
  end

  it 'should list all abilities' do
    expect(@ability_repository.all.count).to be(0)
    expect do
      @ability_repository.create(valid_params)
    end.to change(Ability, :count).by(1)
  end

  it 'should find an ability by id' do
    @ability_repository.create(valid_params)
    ability_founded = @ability_repository.show(1)
    expect(ability_founded.id).to eq(1)
    expect(ability_founded.name).to eq('fire')
  end

  it 'should create a lot of abilities using a array' do
    expect do
      @ability_repository.create_many_abilities(abilities)
    end.to change(Ability, :count).by(2)
  end
end

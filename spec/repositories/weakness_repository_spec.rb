require 'rails_helper'

RSpec.describe WeaknessRepository, type: :model do
  before(:all) do
    @weakness_repository = WeaknessRepository.new
  end

  let(:valid_params) do
    { id: 1, name: 'fire' }
  end

  let(:weakness) do
    %w[grass poison]
  end

  it 'should list all weaknesses' do
    expect(@weakness_repository.all.count).to be(0)
    expect do
      @weakness_repository.create(valid_params)
    end.to change(Weakness, :count).by(1)
  end

  it 'should find a weakness by id' do
    @weakness_repository.create(valid_params)
    weakness_founded = @weakness_repository.show(1)
    expect(weakness_founded.id).to eq(1)
    expect(weakness_founded.name).to eq('fire')
  end

  it 'should create a lot of weaknesses using a array' do
    expect do
      @weakness_repository.create_many_weakness(weakness)
    end.to change(Weakness, :count).by(2)
  end
end

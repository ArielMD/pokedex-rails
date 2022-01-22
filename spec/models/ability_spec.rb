require 'rails_helper'

RSpec.describe Ability, type: :model do
  before(:each) do
    @ability = Ability.new(valid_attributes)
  end

  let(:valid_attributes) do
    { name: 'Espesura' }
  end

  let(:invalid_attributes) do
    { name: '' }
  end

  it 'pokemon ability is valid with valid name' do
    expect(@ability).to be_valid
  end

  it 'pokemon ability is invalid with invalid name' do
    invalid_ability = Ability.new(invalid_attributes)
    expect(invalid_ability).not_to be_valid
  end

  describe 'validations pokemon ability' do
    it { should validate_presence_of(:name) }
  end
end

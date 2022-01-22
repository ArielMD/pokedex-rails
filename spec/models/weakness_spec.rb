require 'rails_helper'

RSpec.describe Weakness, type: :model do
  before(:each) do
    @weakness = Weakness.new(valid_attributes)
  end

  let(:valid_attributes) do
    { name: 'fuego' }
  end

  let(:invalid_attributes) do
    { name: '' }
  end

  it 'pokemon weakness is valid with valid name' do
    expect(@weakness).to be_valid
  end

  it 'pokemon weakness is invalid with invalid name' do
    invalid_weakness = Weakness.new(invalid_weakness)
    expect(invalid_weakness).not_to be_valid
  end

  describe 'validation pokemon weakness' do
    it { should validate_presence_of(:name) }
  end
end

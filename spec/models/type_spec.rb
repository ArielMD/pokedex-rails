require 'rails_helper'

RSpec.describe Type, type: :model do
  before(:each) do
    @type = Type.new(valid_attributes)
  end

  let(:valid_attributes) do
    { name: 'fuego' }
  end

  let(:invalid_attributes) do
    { name: '' }
  end

  it 'pokemon type is valid with valid name' do
    expect(@type).to be_valid
  end

  it 'pokemon type is invalid with invalid name' do
    invalid_type = Type.new(invalid_attributes)
    expect(invalid_type).not_to be_valid
  end

  describe 'validations pokemon type' do
    it { should validate_presence_of(:name) }
  end
end

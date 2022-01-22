require 'rails_helper'

RSpec.describe Pokemon, type: :model do
  before(:each) do
    @pokemon = Pokemon.new(valid_attributes)
  end

  let(:valid_attributes) do
    {
      "detail_page_url": '/el/pokedex/bulbasaur',
      "weight": 6.9,
      "number": '001',
      "height": 0.7,
      "collectibles_slug": 'bulbasaur',
      "featured": 'true',
      "slug": 'bulbasaur',
      "name": 'Bulbasaur',
      "thumbnail_alt_text": 'Bulbasaur',
      "thumbnail_image": 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/001.png'
    }
  end

  it 'pokemon is valid with valid attributes' do
    expect(@pokemon).to be_valid
  end

  it 'pokemon is invalid with invalid attributes' do
    invalid_pokemon = Pokemon.new
    expect(invalid_pokemon).not_to be_valid
  end

  describe 'validations model' do
    it { should validate_presence_of(:detail_page_url) }
    it { should validate_presence_of(:weight) }
    it { should validate_presence_of(:number) }
    it { should validate_uniqueness_of(:number) }
    it { should validate_presence_of(:height) }
    it { should validate_presence_of(:collectibles_slug) }
    it { should validate_presence_of(:featured) }
    it { should validate_presence_of(:slug) }
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:thumbnail_alt_text) }
    it { should validate_presence_of(:thumbnail_image) }
  end
end

class Pokemon < ApplicationRecord
  validates_presence_of :detail_page_url, :weight, :number, :height, :collectibles_slug, :featured, :slug, :name,
                        :thumbnail_alt_text, :thumbnail_image
  validates :number, uniqueness: true

  has_many :pokemon_ability, dependent: :destroy
  has_many :abilities, through: :pokemon_ability

  has_many :pokemon_type, dependent: :destroy
  has_many :types, through: :pokemon_type

  has_many :pokemon_weakness, dependent: :destroy
  has_many :weaknesses, through: :pokemon_weakness
end

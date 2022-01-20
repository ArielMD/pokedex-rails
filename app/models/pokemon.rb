class Pokemon < ApplicationRecord
  validates_presence_of :detail_page_url, :weight, :number, :height, :collectibles_slug, :featured, :slug, :name,
                        :thumbnail_alt_text, :thumbnail_image

  has_many :pokemon_ability
  has_many :abilities, through: :pokemon_ability

  has_many :pokemon_type
  has_many :types, through: :pokemon_type

  has_many :pokemon_weakness
  has_many :weaknesses, through: :pokemon_weakness
end

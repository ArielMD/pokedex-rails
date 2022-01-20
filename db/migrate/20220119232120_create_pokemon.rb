class CreatePokemon < ActiveRecord::Migration[6.1]
  def change
    create_table :pokemons do |t|
      t.string :detail_page_url
      t.float :weight
      t.string :number
      t.float :height
      t.string :collectibles_slug
      t.string :featured
      t.string :slug
      t.string :name
      t.string :thumbnail_alt_text
      t.string :thumbnail_image
      t.timestamps
    end
  end
end

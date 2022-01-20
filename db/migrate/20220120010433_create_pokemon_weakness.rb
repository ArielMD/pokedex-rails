class CreatePokemonWeakness < ActiveRecord::Migration[6.1]
  def change
    create_table :pokemon_weaknesses do |t|
      t.integer :pokemon_id
      t.integer :weakness_id
    end
  end
end

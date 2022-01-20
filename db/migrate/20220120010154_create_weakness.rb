class CreateWeakness < ActiveRecord::Migration[6.1]
  def change
    create_table :weaknesses do |t|
      t.string :name
      t.timestamps
    end
  end
end

class CreateFavoriteSelections < ActiveRecord::Migration[5.2]
  def change
    create_table :favorite_selections do |t|
      t.integer :favorites_list_id
      t.integer :movie_id
      t.integer :position

      t.timestamps
    end
  end
end

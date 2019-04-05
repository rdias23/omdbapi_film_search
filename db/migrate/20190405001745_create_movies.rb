class CreateMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :movies do |t|
      t.string :title
      t.string :director
      t.integer :year
      t.string :rated
      t.text :plot
      t.string :poster
      t.text :response_json
      t.string :imdb_id

      t.timestamps
    end
    add_index :movies, :title
    add_index :movies, :imdb_id
  end
end

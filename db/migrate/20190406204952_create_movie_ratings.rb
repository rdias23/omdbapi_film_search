class CreateMovieRatings < ActiveRecord::Migration[5.2]
  def change
    create_table :movie_ratings do |t|
      t.integer :rating_star_num
      t.references :user, foreign_key: true
      t.references :movie, foreign_key: true

      t.timestamps
    end
  end
end

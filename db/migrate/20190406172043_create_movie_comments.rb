class CreateMovieComments < ActiveRecord::Migration[5.2]
  def change
    create_table :movie_comments do |t|
      t.text :comment
      t.references :user, foreign_key: true
      t.references :movie, foreign_key: true

      t.timestamps
    end
  end
end

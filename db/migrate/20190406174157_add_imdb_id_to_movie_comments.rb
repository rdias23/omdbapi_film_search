class AddImdbIdToMovieComments < ActiveRecord::Migration[5.2]
  def change
    add_column :movie_comments, :imdb_id, :string
  end
end

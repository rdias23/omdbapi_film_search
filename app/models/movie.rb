class Movie < ApplicationRecord
  has_many :favorite_selections
  has_many :favorites_lists, through: :favorite_selections
  has_many :movie_comments
  has_many :movie_ratings

  def self.search_by_title(title_str)
    request_hash = {:type => "title", :term => title_str, :plot => "full"}
    response = Request.get(request_hash)
  end

end
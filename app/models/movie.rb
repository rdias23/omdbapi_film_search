class Movie < ApplicationRecord
  has_many :favorite_selections
  has_many :favorites_lists, through: :favorite_selections
  has_many :movie_comments
  has_many :movie_ratings

  def self.search_by_title(title_str)
    request_hash = {:type => "title", :term => title_str, :plot => "full"}
    response = Request.get(request_hash)
  end

  def avg_mean_rating_float(precision=2)
    return 0 if movie_ratings.length == 0
    sprintf_str = "%0." + precision.to_s + "f"
    sprintf(sprintf_str,movie_ratings.reduce(0){|sum,mr| sum += mr.rating_star_num; sum; } / movie_ratings.length.to_f).to_f
  end

  def average_rating_str_msg
    return "" if movie_ratings.length == 0
    avg_mean_rating_float.to_s + " Stars (from #{movie_ratings.length} Rating#{movie_ratings.length == 1 ? '' : 's'})"
  end

end
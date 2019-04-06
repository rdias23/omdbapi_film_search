class Movie < ApplicationRecord
  has_many :favorite_selections
  has_many :favorites_lists, through: :favorite_selections

  def self.search_by_title(title_str)
    request_hash = {:type => "title", :term => title_str, :plot => "full"}
    response = Request.get(request_hash)
  end

end
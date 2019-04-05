class Movie < ApplicationRecord

  def self.find_by_title(title_str)
    request_hash = {:type => "title", :term => title_str, :plot => "full"}
    response = Request.get(request_hash)
  end

end
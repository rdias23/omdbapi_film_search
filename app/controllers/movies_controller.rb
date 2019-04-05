class MoviesController < ApplicationController

  def search
    response = Movie.find_by_title(params["movie"]["title"])
    movie_attrs = build_movie_attrs(response)

    @movie = case response["Response"]
             when "True"
               Movie.new(movie_attrs)
             when "False"
               Movie.new
             end

    @errors_msg = false
    @errors_msg = "No movie matches" if response["Response"] == "False"

    respond_to do |format|
      format.js { render :file => "/home/search.js.erb" }
    end
  end

  def build_movie_attrs response
    movie_keys_to_include = [:title, :director, :year, :rated, :plot, :poster]
    movie_attrs = response.reduce({}){ |hash,(k,v)| hash[k.downcase.to_sym] = v if movie_keys_to_include.include? k.downcase.to_sym; hash; }

    movie_attrs[:imdb_id] = response["imdbID"]
    movie_attrs[:poster] = "/not_found.png" if movie_attrs[:poster] == "N/A"

    movie_attrs["response_json"] = response.to_json

    movie_attrs
  end

  private

  def movie_params
    params.require(:movie).permit(:id, :title, :director, :year, :rated, :plot, :poster, :response_json, :imdb_id)
  end
end

class MoviesController < ApplicationController

  SELECT_ACTIONS = {:SELECT => "favorite_selection", :DESELECT => "remove_favorite"}

  def search
    response = Movie.search_by_title(params["movie"]["title"])
    movie_attrs = build_movie_attrs(response)

    movie_in_db = Movie.find_by_imdb_id(movie_attrs[:imdb_id])
    response["Response"] = "ignore_because_movie_is_already_in_db" if movie_in_db
    @user = current_user
    @movie = case response["Response"]
             when "True"
               Movie.new(movie_attrs)
             when "False"
               Movie.new
             when "ignore_because_movie_is_already_in_db"
               movie_in_db
             end
    @select_or_deselect_action = if movie_in_db.nil?
                                   SELECT_ACTIONS[:SELECT]
                                 else
                                   if current_user.favorites_list.movies.ids.include? movie_in_db.id
                                     SELECT_ACTIONS[:DESELECT]
                                   else
                                     SELECT_ACTIONS[:SELECT]
                                   end
                                 end

    @errors_msg = (response["Response"] == "False" ? "No movie matches" : false)

    respond_to do |format|
      format.js { render :file => "/home/search.js.erb" }
    end
  end

  def edit
    @movie = Movie.find_by_imdb_id(params["movie"]["imdb_id"])
    @errors_msg = false

    @select_or_deselect_action = if current_user.favorites_list.movies.ids.include? @movie.id
                                   SELECT_ACTIONS[:DESELECT]
                                 else
                                   SELECT_ACTIONS[:SELECT]
                                 end

    respond_to do |format|
      format.js { render :file => "/home/search.js.erb" }
    end
  end

  def favorite_selection
     if params["movie"]["id"].blank?
       @movie = Movie.create(movie_params)
     else
       @movie = Movie.find(params["movie"]["id"])
     end
     @errors_msg = false
     @user = current_user
     @select_or_deselect_action = SELECT_ACTIONS[:DESELECT]

     @user.favorites_list.movies << @movie
     respond_to do |format|
       format.js { render :file => "/home/favorite_selection.js.erb" }
     end
  end

  def remove_favorite
    @movie = Movie.find(params["movie"]["id"])
    @errors_msg = false
    @user = current_user
    @select_or_deselect_action = SELECT_ACTIONS[:SELECT]

    @user.favorites_list.favorite_selections.find_by_movie_id(@movie.id).remove_from_list
    @user.favorites_list.movies.delete(@movie)

    respond_to do |format|
      format.js { render :file => "/home/favorite_selection.js.erb" }
    end
  end


  private

  def movie_params
    params.require(:movie).permit(:id, :title, :director, :year, :rated, :plot, :poster, :response_json, :imdb_id)
  end

  def build_movie_attrs response
    movie_keys_to_include = [:title, :director, :year, :rated, :plot, :poster]
    movie_attrs = response.reduce({}){ |hash,(k,v)| hash[k.downcase.to_sym] = v if movie_keys_to_include.include? k.downcase.to_sym; hash; }

    movie_attrs[:imdb_id] = response["imdbID"]
    movie_attrs[:poster] = "/not_found.png" if movie_attrs[:poster] == "N/A"

    movie_attrs["response_json"] = response.to_json

    movie_attrs
  end
end

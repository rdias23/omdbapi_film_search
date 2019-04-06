class MovieCommentsController < ApplicationController
  def edit
    @movie_comment = MovieComment.where(:user_id => params["movie_comment"]["user_id"]).find_by_imdb_id(params["movie_comment"]["imdb_id"])
    if @movie_comment.nil?
      @movie_comment = MovieComment.new(:user_id => params["movie_comment"]["user_id"], :imdb_id => params["movie_comment"]["imdb_id"], :movie_id => params["movie_comment"]["movie_id"])
    end

    @user = User.find(params["movie_comment"]["user_id"])
    @movie = Movie.find(params["movie_comment"]["movie_id"])

    respond_to do |format|
      format.js { render :file => "/movie_comments/edit.js.erb" }
    end
  end

  def update
    @movie_comment = MovieComment.where(:imdb_id => params["movie_comment"]["imdb_id"]).first_or_create(movie_comment_params)
    @movie_comment.update_attributes(movie_comment_params) unless @movie_comment.id_changed?

    @user = User.find(params["movie_comment"]["user_id"])
    @movie = Movie.find(params["movie_comment"]["movie_id"])
    respond_to do |format|
      format.js { render :file => "/movie_comments/update.js.erb" }
    end
  end

  private

  def movie_comment_params
    params.require(:movie_comment).permit(:id, :comment, :user_id, :imdb_id, :movie_id)
  end
end

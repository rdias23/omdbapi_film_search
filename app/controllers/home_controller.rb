class HomeController < ApplicationController
  def show
    @user = current_user
    @movie = Movie.new
  end
end

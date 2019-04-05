class HomeController < ApplicationController
  def show
    @movie = Movie.new
  end
end

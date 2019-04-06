class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :favorites_list
  has_many :movie_comments

  after_create :add_favorites_list

  def add_favorites_list
    create_favorites_list :title => self.email + "'s Favorites List"
  end

  def yield_movie_comment_of_user movie
    return nil if !movie.imdb_id
    @mc = MovieComment.where(:user_id => self.id).find_by_imdb_id(movie.imdb_id)
    @mc ? @mc : MovieComment.new(:user_id => self.id, :imdb_id => movie.imdb_id)
  end

end

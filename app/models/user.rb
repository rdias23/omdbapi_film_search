class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :favorites_list
  after_create :add_favorites_list

  def add_favorites_list
    create_favorites_list :title => self.email + "'s Favorites List"
  end

end

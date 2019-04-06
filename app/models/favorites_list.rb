class FavoritesList < ApplicationRecord
  belongs_to :user
  has_many :favorite_selections, -> { order(position: :asc) }
  has_many :movies, through: :favorite_selections
end

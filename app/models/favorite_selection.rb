class FavoriteSelection < ApplicationRecord
  belongs_to :favorites_list
  belongs_to :movie
  acts_as_list scope: :favorites_list
end

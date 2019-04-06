Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#show'
  devise_for :users

  post 'movies/search' => 'movies#search', :as => 'movies_search'
  patch 'movies/edit' => 'movies#edit', :as => 'movies_edit'
  patch 'movies/move_up' => 'movies#move_up', :as => 'movies_up'
  patch 'movies/move_down' => 'movies#move_down', :as => 'movies_down'

  post 'movies/favorite_selection' => 'movies#favorite_selection', :as => 'movies_favorite_selection'
  patch 'movies/favorite_selection' => 'movies#favorite_selection', :as => 'patch_movies_favorite_selection'
  patch 'movies/remove_favorite' => 'movies#remove_favorite', :as => 'movies_remove_favorite'

  post 'movies/update_rating ' => 'movies#update_rating', :as => 'movies_update_rating'
  patch 'movies/update_rating ' => 'movies#update_rating', :as => 'patch_movies_update_rating'

  post 'movie_comments/edit' => 'movie_comments#edit', :as => 'movie_comments_edit'
  patch 'movie_comments/edit' => 'movie_comments#edit', :as => 'patch_movie_comments_edit'
  post 'movie_comments/update' => 'movie_comments#update', :as => 'movie_comments_update'
  patch 'movie_comments/update' => 'movie_comments#update', :as => 'patch_movie_comments_update'
end

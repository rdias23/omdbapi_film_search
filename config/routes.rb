Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#show'
  devise_for :users

  post 'movies/search' => 'movies#search', :as => 'movies_search'
  patch 'movies/edit' => 'movies#edit', :as => 'movies_edit'

  post 'movies/favorite_selection' => 'movies#favorite_selection', :as => 'movies_favorite_selection'
  patch 'movies/favorite_selection' => 'movies#favorite_selection', :as => 'patch_movies_favorite_selection'
  patch 'movies/remove_favorite' => 'movies#remove_favorite', :as => 'movies_remove_favorite'

end

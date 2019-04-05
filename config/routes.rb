Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#show'
  devise_for :users

  post 'movies/search' => 'movies#search', :as => 'movies_search'

end

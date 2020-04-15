Rails.application.routes.draw do
  resources :reviews
  resources :user_profiles
  resources :user_books
  resources :reviewed_books
  resources :books
  resources :book_genres
  resources :genres
  resources :authors

  get '/search/:title', to: 'books#search'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

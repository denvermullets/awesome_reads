Rails.application.routes.draw do
  resources :reviews
  resources :user_profiles
  # resources :user_books
  # resources :reviewed_books
  resources :books
  # resources :book_genres
  resources :genres
  resources :authors

  # resources :search
  # resources :search
  get '/search', to: 'books#search', as: 'search_books'

end

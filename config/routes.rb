Rails.application.routes.draw do
  root to: 'books#index'
  resources :reviews
  resources :user_profiles
  resources :user_books
  resources :reviewed_books
  resources :books
  resources :book_genres
  resources :genres
  resources :authors


  get 'search', to: 'books#search', as: 'search_books'

  get 'reviews/new/:book_id', to: 'reviews#new', as: :new_review_book

  get '/sessions/login', to: 'sessions#new', as: 'login'
  post '/sessions', to: 'sessions#create', as: 'sessions'
  delete '/sessions', to: 'sessions#destroy'
end

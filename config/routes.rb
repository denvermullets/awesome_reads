Rails.application.routes.draw do
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

end

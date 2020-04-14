class Book < ApplicationRecord
    has_many :book_genres
    has_many :genres, through: :book_genres

    has_many :authors

    has_many :reviewed_books
    has_many :reviews, through: :reviewed_books

    has_many :user_books
    has_many :user_profiles, through: :user_books

end

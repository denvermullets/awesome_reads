class Genre < ApplicationRecord
    has_many :book_genres
    has_many :books, through: :book_genres

    validates :genre_name, uniqueness: { case_sensitive: false }
end

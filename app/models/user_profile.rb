class UserProfile < ApplicationRecord
    has_many :user_books
    has_many :books, through: :user_books
    has_many :reviews
end

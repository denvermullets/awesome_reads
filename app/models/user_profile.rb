gem 'bcrypt'

class UserProfile < ApplicationRecord
    has_many :user_books
    has_many :books, through: :user_books
    has_many :reviews

    has_secure_password

    
end

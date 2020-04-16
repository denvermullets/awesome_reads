class Review < ApplicationRecord
    belongs_to :user_profile

    has_many :reviewed_books
    has_many :books, through: :reviewed_books

    

end

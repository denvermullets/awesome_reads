class Book < ApplicationRecord
    belongs_to :author

    has_many :book_genres
    has_many :genres, through: :book_genres

    has_many :reviewed_books
    has_many :reviews, through: :reviewed_books

    has_many :user_books
    has_many :user_profiles, through: :user_books

    
    
    # def search_title(title)
    #     url = RestClient.get("https://www.googleapis.com/books/v1/volumes?q=#{title}")
    #     book_info = JSON.parse(url)
    #     byebug
    # end 

end

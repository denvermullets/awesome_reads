class Book < ApplicationRecord
    belongs_to :author

    has_many :book_genres
    has_many :genres, through: :book_genres

    has_many :reviewed_books
    has_many :reviews, through: :reviewed_books

    has_many :user_books
    has_many :user_profiles, through: :user_books
    accepts_nested_attributes_for :book_genres

    def book_genres=(book_genres)
        book_genres.values.each do |book_genre|
          if book_genre["title"].present?
            genre = genre.find_or_create_by(book_genre)
            self.book_genre << genre
          end
        end
      end

      def average_rating
        all_rating = []
        all_rating = self.reviews.map do |review|
          review.rating
        end 
        average_rating = all_rating.sum/all_rating.count
        average_rating
      end 
    
    
    # def search_title(title)
    #     url = RestClient.get("https://www.googleapis.com/books/v1/volumes?q=#{title}")
    #     book_info = JSON.parse(url)
    #     byebug
    # end 

end

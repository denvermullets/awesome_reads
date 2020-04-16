class ReviewedBooksController < ApplicationController

    def index
        @reviewed_books = ReviewedBook.all
    end 
end

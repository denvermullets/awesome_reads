require 'rest-client'
require 'json'

class BooksController < ApplicationController
before_action :find_book, only:[:show, :edit, :update, :destroy]
    def index
        # if there's a query loaded in params on reload, trigger the search via api
        # used this to get a good idea https://melvinchng.github.io/rails/SearchFeature.html#43-adding-a-simple-search-feature

        if params[:q]
            @books = Book.where('title LIKE ?', "%#{params[:q]}%")
            # use this to ping API
            # @search = search_title(params[:q])
          else
            @books = Book.all 
          end

        # @books = Book.all 
    end 

    def show
    end 
       
    def new
        @book = Book.new 
    end 

    def create 
        book = Book.create(book_params)
        if book.valid?
            redirect_to book
        else
            flash[:errors] = @book.errors.full_messages
            redirect_to new_book_path
        end 

    end 
    
    def search
        @search = search_title(params[:q])
    end 

    
    private 

    def search_title(title)
        url = RestClient.get("https://www.googleapis.com/books/v1/volumes?q=#{title}")
        book_title = JSON.parse(url)
        byebug
    end     

    def find_book 
        @book = Book.find(params[:id])
    end 

    def book_params
        params.require(:book).permit(:author_id, :title, :description,:isbn, :img_url, genre_ids:[], book_genre: [:genre_name]) 
        
    end 
end

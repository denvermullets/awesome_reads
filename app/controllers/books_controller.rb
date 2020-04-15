class BooksController < ApplicationController
before_action :find_book, only:[:show, :edit, :update, :destroy]
    def index
        @books = Book.all 
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
        @search = search_title(params[:title])

    end 

    
    private 

    

    def find_book 
        @book = Book.find(params[:id])
    end 

    def book_params
        params.require(:book).permit(:author_id, :title, :description,:isbn, :img_url) 
        
    end 
end

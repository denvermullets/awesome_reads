class BooksController < ApplicationController
before_action :find_book, only:[:show, :edit, :new, :create, :destroy]
    def index
        @books = Book.all 
    end 

    def show
    end 
       
    

    
    private 

    def find_book 
        @book = Book.find(params[:id])
    end 

    def book_params
        params.require(:book).permit(:author_id, :title, :description,:isbn, :img_url)
    end 
end

class GenresController < ApplicationController
    def index
        @genres = Genre.all
        @genres_name = @genres.map do |genre|
            genre.genre_name
        end 
    end 

    def show
        @genre = Genre.find(params[:id])
    end 
end

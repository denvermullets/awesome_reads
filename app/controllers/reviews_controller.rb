class ReviewsController < ApplicationController
    before_action :find_review, only:[:show, :edit, :update, :destroy]
    def show
      
    end 

    def new 
        @review = Review.new
    end 

    def create 
        review = Review.create(review_params)
        if review.valid?
            redirect_to review
        else
            flash[:errors] = @review.errors.full_messages
            redirect_to new_review_path
        end 

    end 



    private

    def find_review
        @review = Review.find(params[:id])
    end 

    def book_params
        params.require(:book).permit(:user_profile_id, :book_id, :rating, :title, :comment)
    end 

end

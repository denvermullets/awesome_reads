class ReviewsController < ApplicationController
    
    skip_before_action :authorized, only: [:index, :show, :create, :new]  # prevents error from new review create
    before_action :find_review, only:[:show, :edit, :update, :destroy]
    
    def show
    end 

    def new 
        if params[:book_id]
            @book_id = params[:book_id]
            @review = Review.new
            @user = UserProfile.find(session[:user_profile_id])

        else
            @review = Review.new
        end 
        # byebug
    end 

    def create 
        review = Review.create(review_params)
        
        if review.valid?
            new_review = Review.order("created_at").last
            reviewed_book = ReviewedBook.create(book_id: new_review.book_id, review_id: new_review.id)
            redirect_to book_path(new_review.book_id)
        else
            flash[:errors] = @review.errors.full_messages
            redirect_to new_review_path
        end 

    end 



    private

    def find_review
        @review = Review.find(params[:id])
    end 

    def review_params
        params.require(:review).permit(:user_profile_id, :book_id, :rating, :title, :comment)
    end 

end

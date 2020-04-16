class SessionsController < ApplicationController
    skip_before_action :authorized, only: [:new, :create]
  
    def new
    end 
  
    def create 
      user_profile = UserProfile.find_by(name: params[:session][:name])
  
      if user_profile && user_profile.authenticate(params[:session][:password])
        session[:user_profile_id] = user_profile.id
        redirect_to user_profile_path(user_profile)
      else 
        flash[:errors] = ["username or password is not right"]
  
        redirect_to new_user_profile_path
        
      end 
    end 
  
    def destroy 
      session.delete(:user_profile_id)
      redirect_to books_path
    end 
  
  end
  
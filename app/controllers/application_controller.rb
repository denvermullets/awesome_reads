class ApplicationController < ActionController::Base
    before_action :get_current_user_profile
    before_action :authorized
  
    def get_current_user_profile 
      @current_user_profile = UserProfile.find_by(id: session[:user_profile_id])
    end 
  
    def authorized
      if @current_user_profile
      else 
        flash[:errors] = ["must be logged in to see that page"]
        redirect_to login_path
      end 
    end 

end

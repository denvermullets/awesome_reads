class UserProfilesController < ApplicationController
    before_action :find_user_profile, only:[:show, :edit, :update, :destroy]
    skip_before_action :authorized, only: [:new, :create]
    def index
        @user_profiles = UserProfile.all 
    end 

    def show  

    end 

    def new 
        @user_profile = UserProfile.new
    end 

    def create 
        user_profile = UserProfile.create(user_profile_params)
        if user_profile.valid?
            session[:user_profile_id] = user_profile.id 
            redirect_to user_profile
        else
            flash[:errors] = user_profile.errors.full_messages
            redirect_to new_user_profile_path
        end 

    end 

    def edit
    end 

    def update
        if @user_profile.update(user_profile_params)
            redirect_to user_profile_path
        else
            flash[:errors] = user_profile.errors.full_messages
            redirect_to edit_user_profile_path
        end 
    end 

    def destroy
        @user_profile.destroy
        redirect_to login_path

    end 

    private 


    def find_user_profile 
        @user_profile = UserProfile.find(params[:id])
    end 

    def user_profile_params
        params.require(:user_profile).permit(:name, :bio, :password)  
    end 

end

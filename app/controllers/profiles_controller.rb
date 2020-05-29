class ProfilesController < ApplicationController

before_action :authenticate, only: [:index, :update]

    def index 
        render json: {message: "#{@user.username}, these are the parks you've added to your profile!"}
    end

    def update
        @user.update(
            username: params[:username]
        )
        render json: { username: @user.username } 
    end


end     


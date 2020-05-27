class ProfilesController < ApplicationController

before_action :authenticate, only: [:index, :update]

    def index 
        authenticate
        render json: {message: "Checkout your personal collection, #{@user.username}!"}
    end

    def update
        @user.update(
            username: params[:username]
        )
        render json: { username: @user.username }
    end

    # def destroy
    #     @user.destroy
    #     render json: { message: @user }
    # end

end     


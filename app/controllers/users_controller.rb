class UsersController < ApplicationController
    
    before_action :authenticate, only: [:destroy]
    
    def index
        @users = User.all
        render json: @users
    end

    def show
        @user = User.find(params[:id])
        render json: @user
    end

    def update
        @user.update(
            username: params[:username]
        )
        render json: { username: @user.username } 
    end

    def create 
        @user = User.new(
            username: params[:username],
            password: params[:password]
        )
        if @user.save
            render json: {message: `#{@user.username} your login was successfully created.`, user: @user}, status: :created
        else
            render json: @user.errors.messages
        end
    end

    def destroy
        @user.destroy(
            username: params[:username],
            password: params[:password]
        )
        render json: { message: "Your profile has been deleted" }
        redirect_to "http://localhost:3000/index.html"
    end

end

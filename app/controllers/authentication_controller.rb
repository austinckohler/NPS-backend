class AuthenticationController < ApplicationController
# this method is creating a token. verifies username and password then creates token
    def login
        @user = User.find_by(username: params[:username])

        if !@user
           render json: {error: "Invalid Username"}, status: :unauthorized
        else 
            if !@user.authenticate params[:password]
                render json: {error: "Invalid Password"}, status: :unauthorized
            else 
                payload ={
                    user_id: @user.id,
                    username: @user.username 
                }
                secret = Rails.application.secrets.secret_key_base
                token = JWT.encode(payload, secret)
                render json: { token: token, username: @user.username }, status: :ok
            end
        end
    end
end

class ApplicationController < ActionController::API

# this method is verifying a token after token is creater by authentication controller
    def authenticate 
        authorization_header = request.headers["Authorization"]
    
            if !authorization_header
                render json: {error: "Incorrect information"}, status: :unauthorized
            else 
                token = authorization_header.split(" ")[1]
                secret = Rails.application.secrets.secret_key_base
                begin
                    payload = JWT.decode(token, secret).first
                    @user = User.find(payload["user_id"]) 
                rescue
                    render json: {error: "Incorrect information"}, status: :unauthorized
                end  
            end
        end

end

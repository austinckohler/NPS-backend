class AlertsController < ApplicationController

        before_action :find_alert_by_id, only: [:show, :update, :destroy]
    
        def index
            @alerts = Alert.all
            render json: @alerts, include: [:park]
        end
        
        def show
            render json: @alert
        end
        
        def create
            @alert = Alert.create(alert_params)
            render json: @alert
        end
        
        def update
            @alert.update(alert_params)
            render json: @alert
        end
        
        def destroy
            @alert.destroy
            redirect_to action: "index"
        end
    
        private 
    
        def alert_params
            params.require(:alert).permit(:title, :description, :category)
        end
    
        def find_alert_by_id
            @alert = Alert.find(params[:id])
        end
end

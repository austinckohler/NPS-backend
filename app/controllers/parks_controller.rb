class ParksController < ApplicationController

        before_action :find_park_by_id, only: [:show, :update, :destroy]
    
        def index
            @parks = Park.all
            render json: @parks, include: [:alerts]
        end
        
        def show
            if @park
                render json: @park, include: [:alerts]
            else 
                render json: {message:"We couldn't find a park with that id"}
            end
        end
        
        def create
            @park = Park.create(park_params)
            render json: @park
        end
        
        def update
            @park.update(park_params)
            render json: @park
        end
        
        def destroy
            @park.destroy
            redirect_to action: "index"
        end
    
        private 
    
        def park_params
            params.require(:park).permit(:state, :url, :weather, :name, :latitude_longitude, :description, :park_code)
        end
    
        def find_park_by_id
            @park = Park.find(params[:id])
        end
end

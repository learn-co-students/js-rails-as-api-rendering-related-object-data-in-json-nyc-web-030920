class SightingsController < ApplicationController

    def show 
        sighting = Sighting.find_by(id: params[:id])
        if sighting 
            render json: sighting, include: [:bird, :location]
        else  
            render json: {message: 'No Sighting Found With That ID' }
        end
    end

    def index 
        sightings = Sighting.all
        render json: sightings, include: [:bird, :location]
    end

end

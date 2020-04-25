class SightingsController < ApplicationController

    def index
        sightings = Sighting.all
        render json: sightings, include: [bird: {only: [:name, :species]}, location: location], except: [:updated_at]
    end

    def show
        sighting = Sighting.find_by(id: params[:id])
        if sighting then
            render json: sighting, include: [:bird, :location], except: [:updated_at]
        else
            render json: { message: "no sighting with that id" }
        end
    end

end

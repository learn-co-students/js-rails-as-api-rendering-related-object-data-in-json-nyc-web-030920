class SightingsController < ApplicationController
  def index
    sightings = Sighting.all
    # will include the bird and location for each sighting nested within their own keys
    render json: sightings, include: [:bird, :location]
  end

  # def show
  #   sighting = Sighting.find_by(id: params[:id])
  #   # render json: sighting
  #   # render json: {id: sighting.id, bird: sighting.bird, location: sighting.location}
  #   if sighting
  #     # render json: sighting, include: [:bird, :location]
  #     # removes the updated_at attritbute for the Sighting object
  #     render json: sighting, include: [:bird, :location], except: [:updated_at]
  #   else
  #      render json: {message: 'No sighting found with that id'}
  #   end
  # end

  # to remove updated_at from the Bird and Location objects
  def show 
    sighting = Sighting.find_by(id: params[:id])

    if sighting
      render json: sighting.to_json(include:
        {
          bird: {only: [:name, :species]},
          location: {only: [:latitude, :longitude]},
        },
          except: [:updated_at])
    else
      render json: {message: 'No sighting found with that id'}
    end
  end
end

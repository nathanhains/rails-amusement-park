class RidesController < ApplicationController
    def create
        @ride = Ride.create(user_id: current_user.id, attraction_id: params[:attraction_id])
        if @ride
            response = @ride.take_ride
            flash[:notice] = response
            redirect_to user_path(current_user)
        end
    end
end

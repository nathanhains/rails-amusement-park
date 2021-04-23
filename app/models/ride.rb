class Ride < ActiveRecord::Base
    belongs_to :user
    belongs_to :attraction

    def take_ride
        @user = User.find_by(id: self.user.id)
        @attraction = Attraction.find_by(id: self.attraction.id)
        if @user.tickets < @attraction.tickets && @user.height < @attraction.min_height
            "Sorry. You do not have enough tickets to ride the #{@attraction.name}. You are not tall enough to ride the #{@attraction.name}."
        elsif @user.height < @attraction.min_height
            "Sorry. You are not tall enough to ride the #{@attraction.name}."
        elsif @user.tickets < @attraction.tickets
            "Sorry. You do not have enough tickets to ride the #{@attraction.name}."
        else
            @user.update(happiness: @user.happiness+@attraction.happiness_rating, nausea: @user.nausea+@attraction.nausea_rating, tickets: @user.tickets-@attraction.tickets)
            @user.save
            "Thanks for riding the #{@attraction.name}!"
        end
    end
end

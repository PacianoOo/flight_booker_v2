class BookingsController < ApplicationController
    def new
        @booking = Booking.new
        @flight = Flight.find(params[:flight_id])
        @passenger_count = params[:passengers].to_i
        params[:passengers].to_i.times { @booking.passengers.build }
    end

    def create
        @booking = current_user.bookings.build(booking_params)
        @booking.user = current_user
    end

    private

    def booking_params
        params.require(:booking).permit(:flight_id, :passenger_id, passengers_attributes: %i[name email])
    end
end

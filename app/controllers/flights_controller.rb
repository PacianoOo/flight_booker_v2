class FlightsController < ApplicationController
  def index
    @arrival_airports = Airport.select(:airport_code, :id).distinct.pluck(:airport_code, :id)
    # @arrival_airports = Airport.select(:airport_code, :id).distinct.map {|a| [a.airport_code,a.id]}
    @departure_airports = Airport.select(:airport_code, :id).distinct.map {|a| [a.airport_code,a.id]}
    @dates = Flight.select(:departure_time)
            .distinct
            .order(:departure_time)
            .map { |flight| [flight.departure_time.strftime("%m/%d/%Y")] }
    @flight_results = Flight.where(
    departure_airport_id: params[:departure_airport], arrival_airport_id: params[:arrival_airport])
  end
end

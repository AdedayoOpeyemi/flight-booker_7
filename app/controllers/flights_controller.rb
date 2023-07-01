class FlightsController < ApplicationController
  def index
    @airports = Airport.all.order(:name)
  end

  def search
    # @flights = Flights.find.where()
  end
end

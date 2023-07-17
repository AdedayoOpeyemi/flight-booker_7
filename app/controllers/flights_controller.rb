class FlightsController < ApplicationController
  def index
    @airports = Airport.all.order(:name)
    @days = Flight.pluck(:start).map { |date| date.strftime('%d/%m/%Y') }.uniq
    # @search = OpenStruct.new(params[:search]) if params[:search].present?
    # @search ||= OpenStruct.new(departure_airport: nil, arrival_airport: nil, date: nil, passenger_count: nil)
  end

  def search
    @search = params[:search]
    departure_code = @search[:departure_airport]
    arrival_code = @search[:arrival_airport]
    date = @search[:date]
    passenger_count= @search[:passenger_count]

    start_date = date.to_datetime.beginning_of_day
    end_date = date.to_datetime.end_of_day

    # Perform smart querying on your Flight model using the provided parameters
    @flights = Flight.where(departure_airport: Airport.find_by(code: departure_code),
                            arrival_airport: Airport.find_by(code: arrival_code),
                            start: start_date..end_date,
                            # num_tickets: num_tickets
                          )
    # Render the flights in the index view
    render 'index'
  end
end

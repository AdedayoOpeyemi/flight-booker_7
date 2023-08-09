class BookingsController < ApplicationController
  def new
    @flight = Flight.find(params[:flight_selection][:flight_id])
    @passenger_count = (params[:flight_selection][:passenger_count]).to_i
    puts @passenger_count
    @booking = @flight.bookings.build
    @passenger_count.times { @booking.passengers.build }
  end

  def create
    @flight = Flight.find(params[:booking][:flight_id])
    @booking = @flight.bookings.build(booking_params)

    if @booking.save
      # Access the IDs after successful booking creation
      booking_id = @booking.id
      flight_id = @flight.id

      @booking.passengers.each do |passenger|
        PassengerMailer.booking_confirmation(passenger, @booking).deliver_now
      # Handle successful booking creation
      end
      redirect_to @booking
    else
      # Handle validation errors
      render :new
    end
  end

  def show
    @booking = Booking.find(params[:id])
  end

  private 
  def booking_params
    params.require(:booking).permit(:flight_id, passengers_attributes: [:name, :age, :email])
  end

end

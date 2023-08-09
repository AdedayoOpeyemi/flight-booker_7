class PassengerMailer < ApplicationMailer
    def booking_confirmation(booking)
        @confirmation = "Booking confirmed"


        booking.passengers.each do |passenger|
            @passenger = passenger.name
            mail to: passenger.email, subject: "Booking Confirmation email"
        end
    end
end

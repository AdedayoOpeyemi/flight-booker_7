class PassengerMailer < ApplicationMailer
    def booking_confirmation(passenger, booking)
        @confirmation = "Booking confirmed"
        @booking = booking

        @passenger = passenger.name
        mail to: passenger.email, subject: "Booking Confirmation email"
    end
end

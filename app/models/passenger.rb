class Passenger < ApplicationRecord
  belongs_to :booking
  # belongs_to :flights, through: :bookings
end

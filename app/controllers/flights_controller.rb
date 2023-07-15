class FlightsController < ApplicationController
  def index
    @airports = Airport.all.order(:name)
    # @days = Flight.all.pluck(:start).strftime("%B, %d, %Y").uniq
    @days = Flight.pluck(:start).map { |date| date.strftime('%d/%m/%Y') }.uniq
  end

  def search
  end
end

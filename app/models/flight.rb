class Flight < ApplicationRecord
  belongs_to :departure_airport, class_name: 'Airport'
  belongs_to :arrival_airport, class_name: 'Airport'

  def self.distinct_dates
    distinct_dates = Flight.select("DATE(datetime) as date").distinct.pluck(:start).strftime("%m/%d/%Y")
  end

  def departure_date_formatted
    departure_date.strftime("%B, %d, %Y")
  end

  def departure_time_formatted
    departure_time.strftime("%l:%M %P")
  end

  # def event_date_formatted
  #   event_date.strftime("%m/%d/%Y")
  # end
end

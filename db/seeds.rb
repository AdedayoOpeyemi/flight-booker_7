# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'csv'

airports_csv = File.read('db/data/airport_list.csv')
airports = CSV.parse(airports_csv, headers: true)

airports.each do |airport|
    Airport.create!(
        name: airport['name'],
        city: airport['city'],
        code: airport['code']
    )
end
    
airport_ids = Airport.pluck(:id)

75.times do
    departure_airport_id = airport_ids.sample
    arrival_airport_id = (airport_ids - [departure_airport_id]).sample
    start = Time.now + rand(1..30).days
    duration = rand(60..240)
    Flight.create!(
        departure_airport_id: departure_airport_id,
        arrival_airport_id: arrival_airport_id,
        start: start,
        duration: duration
    )
end

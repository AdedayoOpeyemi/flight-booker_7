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

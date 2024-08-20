# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Flight.destroy_all
Airport.destroy_all

puts 'All clear'

15.times do |i|
    Airport.create!(airport_code: Faker::Travel::Airport.iata(size: 'large', region: 'united_states'))
    puts "#{Airport.last.airport_code}"
end

airports = Airport.all
number = ("0" .. "9").to_a
letter = ("A".."Z").to_a
duration = (1 .. 15).to_a
# date = Faker::Date.forward(days: 23)
100.times do |i|
Flight.create!(
    flight_number: "#{letter.sample}#{letter.sample}#{number.sample}#{number.sample}#{number.sample}",
    departure_time: Faker::Date.forward(days: 10),
    flight_duration: duration.sample,
    departure_airport: airports.sample,
    arrival_airport: airports.sample
)
puts Flight.last.flight_number

end
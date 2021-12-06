# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Deleting all GolfRange data"
GolfRange.destroy_all
puts "Seeding golf-range data 🌱"
name = ["Marina Bay", "Champions", "Bukit Batok", "Punggol Par Range", "Mandai"]

address = ["80 Rhu Cross, 01, Singapore 437437",
           "60 Fairways Dr., Singapore 286966",
           "Bukit Batok West Avenue 7 #01-08, Bukit Batok Rd",
           "60 Punggol E, Singapore 828825",
           "Upper Seletar Reservoir, Mandai Rd Track 7, 779384"]

name.each_with_index do |n, index|
  golf = GolfRange.new(name: n,
                  address: address[index])
  puts "creating #{golf.name}"
  golf.save!
end

puts "Seeding golf-range data done. 👌"

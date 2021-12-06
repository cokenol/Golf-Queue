# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Deleting all QueueWall data"
QueueWall.destroy_all
puts "Deleting all GolfRange data"
GolfRange.destroy_all
puts "Deleting all User data"
User.destroy_all

puts "Seeding golf-range data 🌱"
name = ["Marina Bay", "Champions", "Bukit Batok", "Punggol Par Range", "Mandai"]

address = ["80 Rhu Cross, 01, Singapore 437437",
           "60 Fairways Dr., Singapore 286966",
           "Bukit Batok West Avenue 7 #01-08, Bukit Batok Rd",
           "60 Punggol E, Singapore 828825",
           "Upper Seletar Reservoir, Mandai Rd Track 7, 779384"]

levels = { "Marina Bay" => %w[L1 L2 L3],
           "Champions" => %w[L1 L2],
           "Bukit Batok" => %w[L1 L2 L3],
           "Punggol Par Range" => %w[L1 L2],
           "Mandai" => %w[L1 L2] }

# photos_image_id = { "Marina Bay" => "range_mujard",
#                     "Champions" => "ChampionsBukitTimah-010_pmuqmc",
#                     "Bukit Batok" => "bukitBatok_gfbmyn",
#                     "Punggol Par Range" => "Punggol",
#                     "Mandai" => "Mandai_qryana" }

photos_url = { "Marina Bay" => "https://res.cloudinary.com/din6svi45/image/upload/v1638787379/production/range_mujard.jpg",
                    "Champions" => "https://res.cloudinary.com/din6svi45/image/upload/v1638788166/production/ChampionsBukitTimah-010_pmuqmc.jpg",
                    "Bukit Batok" => "https://res.cloudinary.com/din6svi45/image/upload/v1638787657/production/bukitBatok_gfbmyn.jpg",
                    "Punggol Par Range" => "https://res.cloudinary.com/din6svi45/image/upload/v1638788181/production/Punggol.jpg",
                    "Mandai" => "https://res.cloudinary.com/din6svi45/image/upload/v1638787728/production/Mandai_qryana.jpg" }

latlong = [[1.2934890689052803, 103.87154692615685],
           [1.3457101683248145, 103.79643725499207],
           [1.3657171405712318, 103.74844451081523],
           [1.3957574633567735, 103.91756995499189],
           [1.400995085937511, 103.80911723965048]]

20.times do
  user = User.new(
    email: Faker::Internet.email,
    password: Faker::Internet.password
  )
  puts "creating user #{user.email}"
  user.save!
end

name.each_with_index do |n, index|
  golf = GolfRange.new(
    name: n,
    address: address[index],
    latitude: latlong[index][0],
    longitude: latlong[index][1],
    photo_url: photos_url[n])
  puts "Creating #{golf.name}"
  golf.save!
  puts "Seeding golf-range data done. 👌"
  puts "Seeding QueueWall Data #{index + 1}🚀"

  levels[golf.name].each do |v|
    queue = QueueWall.new(
      golf_range_id: GolfRange.find_by_name(golf.name).id,
      user_id: User.all.sample.id,
      level: v,
      queue_length: rand(0..23))
    puts "Creating #{queue}"
    queue.save!
  end

end

puts "Done seeding data 👌"

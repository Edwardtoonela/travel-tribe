require 'date'
current_datetime = DateTime.now
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Adding dummy user"
User.create!(full_name: 'Fabio', email: "fabio@gmail.com", password: '123456', user_name: 'Fabio1')

puts "Adding dummy trip"
Trip.create!(name: "Chill trip to Amsterdam", start_date: '05-07-2022', end_date: "05-22-2022", description: 'Best trip ever i can not belivev asdkfnskd fksdnf', location: 'Madafuckinggaskar', max_guests: "7")
Trip.create!(name: "India awaits", start_date: '07-11-2022', end_date: "07-12-2022", description: 'Well this is going to be a big one. We are going to India for a month I can not believe it. You have to see this with your own eyes.', location: 'India', max_guests: "4")
puts "Adding dummy ratings"
Review.create!(comment: "Horrible. I cant recommend this to anyone", rating: '5', user: User.first, trip: Trip.first)

puts "Finished"

require 'date'
current_datetime = DateTime.now
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# DESTROY ALL
puts "Clening DataBase"
Message.destroy_all
Trip.destroy_all
User.destroy_all
Chatroom.destroy_all
puts "..."
puts "Data Base is clean!"

# CREATING NEW
puts "Adding dummy user"
User.create!(full_name: 'Fabio', email: "fabio@gmail.com", password: '123456', user_name: 'Fabio')
User.create!(full_name: 'Bart Simpson', email: "homer@gmail.com", password: '123456', user_name: 'Bart')
puts "..."
puts "Finished"

# CREATING TRIP

# puts 'creating a trip'
# puts "..."
# new_trip = Trip.create(start_date: '01-05-2023', end_date:'03-05-2023', description: "Trip to Le Wagon HQ", address: "16 Villa Gaudelet, Paris", name: "Le Wagon HQ", max_guests: 8, price_min: 2000, price_max: 3200, latitude: 48.8648472, longitude: 2.3798534, user_id: 1, location: "Paris")
# puts "Finished"
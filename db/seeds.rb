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
Trip.create!(start_date: '05-07-2022', end_date: "05-22-2022", description: 'Best trip ever i can not belivev asdkfnskd fksdnf', location: 'Madafuckinggaskar')

puts "Finished"

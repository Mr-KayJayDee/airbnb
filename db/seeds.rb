# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# db/seeds.rb
require "faker"

users = User.all

# loop all users
users.each do |user|
  # create 3 cars for each user
  3.times do
    Car.create(user_id: user.id, brand: Faker::Vehicle.make, model: Faker::Vehicle.model, price_per_day: rand(50..200))
  end

  # create 3 bookings for each user
  3.times do
    Booking.create(user_id: user.id, car_id: rand(1..Car.count), start_date: Date.today + rand(1..10), end_date: Date.today + rand(11..20))
  end
end

puts "Seed data has been created."

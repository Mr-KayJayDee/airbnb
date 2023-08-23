# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# db/seeds.rb
require "faker"

# get all cars and add an address to them
Car.all.each do |car|
  puts "Adding address to #{car.brand} #{car.model}"
  car.address = Faker::Address.full_address
  car.save!
end

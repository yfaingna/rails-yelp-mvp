# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
#

# Seed your restaurant database in db/seeds.rb with at least 5 valid restaurant records.
# Added a gem faker here
require "faker"

puts "Destroy data"
Restaurant.destroy_all
puts "Data destroyed"

puts "Creating restaurants..."
5.times do
  # Category has to be from the existing list - Class (Restaurant)::Constant (CATEGORIES).Random selection
	restaurant = Restaurant.create(name: Faker::Restaurant.name, address: Faker::Address.street_address, category: Restaurant::CATEGORIES.sample )
	puts "Created #{restaurant.name} restaurant"
end

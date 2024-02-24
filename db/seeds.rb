# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require 'date'

User.destroy_all

city = ["Berlin", "London", "Amsterdam", "Paris", "Tokyo"]
gender = ["male", "female", "non-binary", "other"]

6.times do
  user = User.new(
    username: Faker::Name.first_name,
    email: Faker::Internet.email,
    adress: city.sample,
    password: "1234567",
    description: "blablablabalbalbalablabalbalabla",
    gender: gender.sample,
    birthdate: "17/01/2007"
  )
  user.save!
end

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Cleaning database...."

Symptom.destroy_all
Disease.destroy_all
User.destroy_all

puts "Creating users..."
User.create!(email: "ellie@lewagon.com" , password: "secret", first_name: "Ellie", last_name: "Holmes")

puts "Creating diseases..."
Disease.create!(user: User.all.sample, name: "Cystic Fibrosis")

puts "Creating symptoms..."
Symptom.create!(disease: Disease.all.sample, name: "Cough")

puts "Done! #{User.count} users created."
puts "Done! #{Disease.count} diseases created."
puts "Done! #{Symptom.count} symptoms created."

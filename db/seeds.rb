require 'open-uri'

file = URI.open('https://images.unsplash.com/photo-1485893086445-ed75865251e0?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1000&q=80')

puts "Cleaning database...."

SymptomCheck.destroy_all
Symptom.destroy_all
Disease.destroy_all
User.destroy_all

puts "Creating users..."
ellie = User.create!(email: "ellie@lewagon.com" , password: "secret", first_name: "Ellie", last_name: "Holmes", dob: "25/08/2001", nhs_number: "3437773456", gender: "Female")

ellie.photo.attach(io: file, filename: 'ellie.jpeg', content_type: 'image/jpeg')

puts "Creating diseases..."
Disease.create!(user: User.all.sample, name: "Cystic Fibrosis")

puts "Creating symptoms..."
Symptom.create!(disease: Disease.all.sample, name: "Cough")

puts "Done! #{User.count} users created."
puts "Done! #{Disease.count} diseases created."
puts "Done! #{Symptom.count} symptoms created."

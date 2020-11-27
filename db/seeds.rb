require 'open-uri'

file = URI.open('https://images.unsplash.com/photo-1535737525997-df1c90ca41cb?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1230&q=80')
arthur_img = URI.open('https://kitt.lewagon.com/placeholder/users/arthur-littm')
lucien_img = URI.open('https://kitt.lewagon.com/placeholder/users/lucien-george')
lucy_img = URI.open('https://kitt.lewagon.com/placeholder/users/lucyksilver')

puts "Cleaning database...."

Doctor.destroy_all
SymptomCheck.destroy_all
Symptom.destroy_all
Disease.destroy_all
User.destroy_all


puts "Creating users..."

ellie = User.create!(email: "ellie@lewagon.com" , password: "secret", first_name: "Ellie", last_name: "Holmes", dob: DateTime.new(2001,12,10), gender: "Female", nhs_number: 12345678)
ellie.photo.attach(io: file, filename: 'ellie.jpeg', content_type: 'image/jpeg')

arthur = User.create!(email: "arthur@lewagon.com" , password: "secret", first_name: "Arthur", last_name: "Littman", dob: DateTime.new(1992,12,10), gender: "Male", nhs_number: 12345678)
arthur.photo.attach(io: arthur_img, filename: 'arthur.jpeg', content_type: 'image/jpeg')

lucien = User.create!(email: "lucien@lewagon.com" , password: "secret", first_name: "Lucien", last_name: "George", dob: DateTime.new(1992,12,10), gender: "Male", nhs_number: 12345678)
lucien.photo.attach(io: lucien_img, filename: 'lucien.jpeg', content_type: 'image/jpeg')

lucy = User.create!(email: "lucy@lewagon.com" , password: "secret", first_name: "Lucy", last_name: "Silver", dob: DateTime.new(1994,12,10), gender: "Female", nhs_number: 12345678)
lucy.photo.attach(io: lucy_img, filename: 'lucy.jpeg', content_type: 'image/jpeg')

puts "Creating doctors"
Doctor.create!(specialty: "Respiratory", description: "I am here to help you with anything related to your lung system.", user_id: arthur.id)
Doctor.create!(specialty: "Physio", description: "I am here to help you with any physiological rehabilitation.", user_id: lucien.id)
Doctor.create!(specialty: "GP", description: "I am here to help you with any minor illnesses.", user_id: lucy.id)

puts "Creating diseases..."
disease = Disease.create!(user: ellie, name: "Cystic Fibrosis")

puts "Creating symptoms..."
symptom = Symptom.create!(disease: Disease.all.sample, name: "Cough")

puts "Creating symptom checks..."
SymptomCheck.create!(rating: 5, symptom_id: symptom.id, user_id: ellie.id, created_at: "2020-11-26 19:08:00")
SymptomCheck.create!(rating: 4, symptom_id: symptom.id, user_id: ellie.id, created_at: "2020-11-25 19:08:00")
SymptomCheck.create!(rating: 3, symptom_id: symptom.id, user_id: ellie.id, created_at: "2020-11-24 19:08:00")
SymptomCheck.create!(rating: 3, symptom_id: symptom.id, user_id: ellie.id, created_at: "2020-11-23 19:08:00")
SymptomCheck.create!(rating: 2, symptom_id: symptom.id, user_id: ellie.id, created_at: "2020-11-22 19:08:00")
SymptomCheck.create!(rating: 1, symptom_id: symptom.id, user_id: ellie.id, created_at: "2020-11-21 19:08:00")
SymptomCheck.create!(rating: 1, symptom_id: symptom.id, user_id: ellie.id, created_at: "2020-11-20 19:08:00")
SymptomCheck.create!(rating: 2, symptom_id: symptom.id, user_id: ellie.id, created_at: "2020-11-19 19:08:00")
SymptomCheck.create!(rating: 1, symptom_id: symptom.id, user_id: ellie.id, created_at: "2020-11-18 19:08:00")

# puts "Creating appointments for Ellie..."
# Appointment.create!(type: "In-person")

# puts "Creating checks..."
# SymptomCheck.create!(user: User.all.sample, symptom: Symptom.all.sample, rating: 5, description: "Feeling regular", created_at: (Date.today - 1.day))

puts "Done! #{User.count} users created."
puts "Done! #{Disease.count} diseases created."
puts "Done! #{Symptom.count} symptoms created."
puts "Done! #{SymptomCheck.count} symptom checks created."


require 'open-uri'

file = URI.open('https://images.unsplash.com/photo-1535737525997-df1c90ca41cb?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1230&q=80')
arthur_img = URI.open('https://kitt.lewagon.com/placeholder/users/arthur-littm')
lucien_img = URI.open('https://kitt.lewagon.com/placeholder/users/lucien-george')
lucy_img = URI.open('https://kitt.lewagon.com/placeholder/users/lucyksilver')

puts "Cleaning database...."

Order.destroy_all
Message.destroy_all
Chat.destroy_all
AppointmentSummary.destroy_all
Appointment.destroy_all
Prescription.destroy_all
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
dr_arthur = Doctor.create!(specialty: "Respiratory", description: "I am here to help you with anything related to your lung system.", user_id: arthur.id)
dr_lucien = Doctor.create!(specialty: "Physio", description: "I am here to help you with any physiological rehabilitation.", user_id: lucien.id)
dr_lucy = Doctor.create!(specialty: "GP", description: "I am here to help you with any minor illnesses.", user_id: lucy.id)

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

puts "Creating prescriptions..."
Prescription.create!(name: "Tobramycin", dose: "300mg", frequency: "Repeats 1/2", duration: "28 days", doctor_id: Doctor.all.sample.id, user_id: ellie.id, price: 5, sku: 'Tobramycin-300mg-1-2')
Prescription.create!(name: "Salbutamol", dose: "100mcg", frequency: "Repeats 1/4", duration: "15 days", doctor_id: Doctor.all.sample.id, user_id: ellie.id, price: 5, sku: 'Salbutamol-100mcg-1-4')
Prescription.create!(name: "Hypertonic saline", dose: "4ml", frequency: "Repeats 1/3", duration: "11 days", doctor_id: Doctor.all.sample.id, user_id: ellie.id, price: 5, sku: 'Hypertonic-saline-4ml-1-3')
Prescription.create!(name: "Creon", dose: "1-2 capsules", frequency: "With every meal", duration: "43 days", doctor_id: Doctor.all.sample.id, user_id: ellie.id, price: 5, sku: 'Creaon-1-c')

puts "Creating chats..."
chat = Chat.create!(doctor: dr_arthur, user: ellie)

puts "Creating messages"
Message.create!(chat: chat, user: ellie, content: "Hi doctor Littman, I have a really bad cough this week", unread: false)
Message.create!(chat: chat, user: arthur, content: "Hi Ellie, let me call you and we can talk", unread: false)
Message.create!(chat: chat, user: ellie, content: "okay", unread: false)
Message.create!(chat: chat, user: arthur, content: "Okay Ellie, as we dicussed in the call I am going to prescribe you some antibiotics for 5 days. You will recieve the summary of the call shortly", unread: false)
Message.create!(chat: chat, user: ellie, content: "Thank you!", unread: false)
Message.create!(chat: chat, user: arthur, content: "No problem, if it gets worse in the coming days tell me asap", unread: false)

puts "Done! #{User.count} users created."
puts "Done! #{Doctor.count} doctors created"
puts "Done! #{Disease.count} diseases created."
puts "Done! #{Symptom.count} symptoms created."
puts "Done! #{SymptomCheck.count} symptom checks created."
puts "Done! #{Prescription.count} prescriptions created."
puts "Done! #{Chat.count} chats created."
puts "Done! #{Message.count} messages created."


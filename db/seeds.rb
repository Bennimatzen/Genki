
puts "Cleaning database...."

SymptomCheck.destroy_all
Symptom.destroy_all
Disease.destroy_all
User.destroy_all

puts "Creating users..."
user = User.create!(email: "ellie@lewagon.com" , password: "secret", first_name: "Ellie", last_name: "Holmes", dob: DateTime.new(2001,12,10), gender: "Female", nhs_number: 12345678)

puts "Creating diseases..."
disease = Disease.create!(user: User.all.sample, name: "Cystic Fibrosis")

puts "Creating symptoms..."
symptom = Symptom.create!(disease: Disease.all.sample, name: "Cough")

puts "Creating symptom checks..."
SymptomCheck.create!(rating: 5, symptom_id: symptom.id, user_id: user.id, created_at: "2020-11-24 19:08:00")
SymptomCheck.create!(rating: 4, symptom_id: symptom.id, user_id: user.id, created_at: "2020-11-23 19:08:00")
SymptomCheck.create!(rating: 3, symptom_id: symptom.id, user_id: user.id, created_at: "2020-11-22 19:08:00")
SymptomCheck.create!(rating: 2, symptom_id: symptom.id, user_id: user.id, created_at: "2020-11-21 19:08:00")
SymptomCheck.create!(rating: 1, symptom_id: symptom.id, user_id: user.id, created_at: "2020-11-20 19:08:00")
SymptomCheck.create!(rating: 1, symptom_id: symptom.id, user_id: user.id, created_at: "2020-11-19 19:08:00")
SymptomCheck.create!(rating: 1, symptom_id: symptom.id, user_id: user.id, created_at: "2020-11-18 19:08:00")

puts "Done! #{User.count} users created."
puts "Done! #{Disease.count} diseases created."
puts "Done! #{Symptom.count} symptoms created."
puts "Done! #{SymptomCheck.count} symptom checks created."





puts "Cleaning database...."

SymptomCheck.destroy_all
Symptom.destroy_all
Disease.destroy_all
User.destroy_all

puts "Creating users..."
User.create!(email: "ellie@lewagon.com" , password: "secret", first_name: "Ellie", last_name: "Holmes", dob: DateTime.new(2001,12,10), gender: "Female", nhs_number: 12345678)

puts "Creating diseases..."
Disease.create!(user: User.all.sample, name: "Cystic Fibrosis")

puts "Creating symptoms..."
Symptom.create!(disease: Disease.all.sample, name: "Cough")

puts "Creating checks..."
SymptomCheck.create!(user: User.all.sample, symptom: Symptom.all.sample, rating: 5, description: "Feeling regular", created_at: (Date.today - 1.day))

puts "Done! #{User.count} users created."
puts "Done! #{Disease.count} diseases created."
puts "Done! #{Symptom.count} symptoms created."
puts "Done! #{SymptomCheck.count} symptom checks created."

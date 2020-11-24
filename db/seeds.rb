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

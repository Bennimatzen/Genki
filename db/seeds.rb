require 'open-uri'

file = URI.open('https://images.unsplash.com/photo-1535737525997-df1c90ca41cb?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1230&q=80')
arthur_img = URI.open('https://kitt.lewagon.com/placeholder/users/arthur-littm')
lucien_img = URI.open('https://kitt.lewagon.com/placeholder/users/lucien-george')
lucy_img = URI.open('https://kitt.lewagon.com/placeholder/users/lucyksilver')
genki_img = URI.open('https://m.media-amazon.com/images/I/71lBytwsHzL._AC_UL320_.jpg')

raeesa_img = URI.open('https://avatars3.githubusercontent.com/u/68662389?s=460&u=3145fe5f3c21ae706a111706b3e88666d6e8052d&v=4')
areeb_img = URI.open('https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1605027582/xa2dcpwiclyyhl1ukrw4.jpg')
bennie_img = URI.open('https://avatars2.githubusercontent.com/u/68373422?s=460&u=c0305c43aae7809c60f21317727ed80471260fe0&v=4')
pepe_img = URI.open('https://avatars3.githubusercontent.com/u/64612007?v=4')

puts "Cleaning database..."

PrescriptionCheck.destroy_all
Pharmacy.destroy_all
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

puts "Creting Genki Bot..."
genki = User.create!(email: "genki@bot.com" , password: "secret", first_name: "Bot", last_name: "Genki", dob: DateTime.new(1992,8,12), gender: "Sexy Bot", nhs_number: 12345678)
genki.photo.attach(io: genki_img, filename: 'genki.jpeg', content_type: 'image/jpeg')
genki_bot = Doctor.create!(specialty: "My specialty is helping you", description: "Hi! I am Genki Bot", user_id: genki.id)
genki_bot_chat = Chat.create!(doctor: genki_bot, user: ellie)

puts "Creating doctors"
dr_arthur = Doctor.create!(specialty: "Respiratory", description: "I am here to help you with anything related to your lung system.", user_id: arthur.id)
dr_lucien = Doctor.create!(specialty: "Physio", description: "I am here to help you with any physiological rehabilitation.", user_id: lucien.id)
dr_lucy = Doctor.create!(specialty: "GP", description: "I am here to help you with any minor illnesses.", user_id: lucy.id)

puts "Creating Genki Team!"
raeesa = User.create!(email: "raeesa@genki.org", password: "secret", first_name: "Raeesa", last_name: "Qureshi", dob: DateTime.new(1993,4,10), gender: "Female", nhs_number: 12345678)
raeesa.photo.attach(io: raeesa_img, filename: 'raeesa.jpeg', content_type: 'image/jpeg')
dr_raeesa = Doctor.create!(specialty: "Waking up 10 seconds before the lecture", description: "Honestly she is the only one in this list whose medical advice you should trust", user_id: raeesa.id)

areeb = User.create!(email: "areeb@genki.org", password: "secret", first_name: "Areeb", last_name: "Bhaila", dob: DateTime.new(1992,5,12), gender: "Male", nhs_number: 12345678)
areeb.photo.attach(io: areeb_img, filename: 'areeb.jpeg', content_type: 'image/jpeg')
dr_areeb = Doctor.create!(specialty: "Fixing margins and padding", description: "DO NOT mess with his front end. Loves bowling and eating at the vietnamese place", user_id: areeb.id)

bennie = User.create!(email: "bennie@genki.org", password: "secret", first_name: "Benjamin", last_name: "Matzen", dob: DateTime.new(2001,1,26), gender: "Male", nhs_number: 12345678)
bennie.photo.attach(io: bennie_img, filename: 'bennie.jpeg', content_type: 'image/jpeg')
dr_bennie = Doctor.create!(specialty: "A killer with a scalpel...literally", description: "He will fix you up and create awesome maps, but be careful; he might shoot you in a safari and put you up next to the gazelles in his wall in Germany", user_id: bennie.id)

pepe = User.create!(email: "pepe@genki.org", password: "secret", first_name: "Jose", last_name: "Benitez", dob: DateTime.new(1992,8,12), gender: "Sexy Bot", nhs_number: 12345678)
pepe.photo.attach(io: pepe_img, filename: 'pepe.jpeg', content_type: 'image/jpeg')
dr_pepe = Doctor.create!(specialty: "Telling bad jokes", description: "Will provide emotional support right before making things really awkward. Will cure you just to avoid eye contact", user_id: pepe.id)

puts "Creating diseases..."
disease = Disease.create!(user: ellie, name: "Cystic Fibrosis")

puts "Creating symptoms..."
symptom = Symptom.create!(disease: Disease.all.sample, name: "Cough")

puts "Creating symptom checks..."
SymptomCheck.create!(rating: 3, symptom_id: symptom.id, user_id: ellie.id, created_at: "2020-12-02 19:08:00")
SymptomCheck.create!(rating: 2, symptom_id: symptom.id, user_id: ellie.id, created_at: "2020-12-01 19:08:00")
SymptomCheck.create!(rating: 1, symptom_id: symptom.id, user_id: ellie.id, created_at: "2020-11-30 19:08:00")
SymptomCheck.create!(rating: 1, symptom_id: symptom.id, user_id: ellie.id, created_at: "2020-11-29 19:08:00")
SymptomCheck.create!(rating: 2, symptom_id: symptom.id, user_id: ellie.id, created_at: "2020-11-28 19:08:00")
SymptomCheck.create!(rating: 1, symptom_id: symptom.id, user_id: ellie.id, created_at: "2020-11-27 19:08:00")
SymptomCheck.create!(rating: 1, symptom_id: symptom.id, user_id: ellie.id, created_at: "2020-11-26 19:08:00")
SymptomCheck.create!(rating: 2, symptom_id: symptom.id, user_id: ellie.id, created_at: "2020-11-25 19:08:00")
SymptomCheck.create!(rating: 1, symptom_id: symptom.id, user_id: ellie.id, created_at: "2020-11-24 19:08:00")

puts "Creating Pharmacies"
Pharmacy.create(name:"Boots", address:"Black Chruch Lane")
Pharmacy.create(name:"Lloyds Pharmacy", address:"138 Kingsland Rd, London E2 8DY")
Pharmacy.create(name:"Superdrug", address:"22 Tudor St, London EC4Y 0AY, Vereinigtes Königreich")
Pharmacy.create(name:"Asda Pharmacy", address:"83 Guilford St, Bloomsbury, London WC1N 1DD, Vereinigtes Königreich")
Pharmacy.create(name:"Gordons Chemis", address:"33 Page's Walk, London SE1 4SB, Vereinigtes Königreich")
Pharmacy.create(name:"Morrisons Pharmacy", address:"Stockwell, London, Vereinigtes Königreich")

puts "Creating prescriptions..."
Prescription.create!(name: "Doxycycline", dose: "200mg", frequency: "Once daily", duration: 14, doctor_id: Doctor.all.sample.id, user_id: ellie.id, price: 9, sku: 'Doxycycline-200mg-1-2')
Prescription.create!(name: "Tobramycin", dose: "300mg", frequency: "Twice daily", duration: 28, doctor_id: Doctor.all.sample.id, user_id: ellie.id, price: 9, sku: 'Tobramycin-300mg-1-2', created_at: "2020-11-24 19:08:00")
Prescription.create!(name: "Salbutamol", dose: "100mcg", frequency: "Four times daily", duration: 15, doctor_id: Doctor.all.sample.id, user_id: ellie.id, price: 9, sku: 'Salbutamol-100mcg-1-4', created_at: "2020-11-24 19:08:00")
Prescription.create!(name: "Hypertonic saline", dose: "4ml", frequency: "Once daily", duration: 11, doctor_id: Doctor.all.sample.id, user_id: ellie.id, price: 9, sku: 'Hypertonic-saline-4ml-1-3', created_at: "2020-11-24 19:08:00")
Prescription.create!(name: "Creon", dose: "1-2 capsules", frequency: "With every meal", duration: 43, doctor_id: Doctor.all.sample.id, user_id: ellie.id, price: 9, sku: 'Creaon-1-c', created_at: "2020-11-24 19:08:00")

puts "Creating chats..."
chat = Chat.create!(doctor: dr_arthur, user: ellie)

puts "Creating messages..."
Message.create!(chat: chat, user: ellie, content: "Hi doctor Littman, I have a really bad cough this week", unread: false)
Message.create!(chat: chat, user: arthur, content: "Hi Ellie, let me call you and we can talk", unread: false)
Message.create!(chat: chat, user: ellie, content: "okay", unread: false)
Message.create!(chat: chat, user: arthur, content: "Okay Ellie, as we dicussed in the call I am going to prescribe you some antibiotics for 5 days. You will recieve the summary of the call shortly", unread: false)
Message.create!(chat: chat, user: ellie, content: "Thank you!", unread: false)
Message.create!(chat: chat, user: arthur, content: "No problem, if it gets worse in the coming days tell me asap", unread: false)

puts "Creating appointments..."
old_appointment1 = Appointment.create!(appointment_type: "Remote", start_date: DateTime.new(2020,9,15,9,0,0), end_date: DateTime.new(2020,9,15,10,0,0), record_share: true, user: ellie, doctor: dr_arthur)
old_appointment2 = Appointment.create!(appointment_type: "Remote", start_date: DateTime.new(2020,10,5,9,0,0), end_date: DateTime.new(2020,10,5,10,0,0), record_share: true, user: ellie, doctor: dr_lucy)
old_appointment3 = Appointment.create!(appointment_type: "Remote", start_date: DateTime.new(2020,11,8,9,0,0), end_date: DateTime.new(2020,11,8,10,0,0), record_share: true, user: ellie, doctor: dr_arthur)

puts "Creating appointment summaries..."
AppointmentSummary.create!(appointment: old_appointment1, content: "- Symptoms of persistent cough, tiredness, and wheezing presented.
                                                                    - Diagnosis of suspected bacterial chest infection.",
                                                                    plan: "
                                                                    - Follow one course of Amoxicillin.
                                                                    - Drink lots of water and get lots of rest.
                                                                    - If you do not feel better after one week book a follow up appointment with a GP", unread: false)
AppointmentSummary.create!(appointment: old_appointment2, content: "- Persistent issues with lower back pain.
                                                                    - Brought on when working on a desk for long periods.",
                                                                    plan: "
                                                                    - Decision to put on a low carb diet to bring BMI which is above 25 down near to 20.
                                                                    - Try to lower in take of carbs, especially at dinner times.
                                                                    - When working take a short break after 30 mins and regularly do stretches shown during session.", unread: false)
AppointmentSummary.create!(appointment: old_appointment3, content: "- Blood pressure and adherence are regular. Repeat prescription renewed.",
                                                                    plan: "
                                                                    - Prescription renewed, no further actions required.", unread: false)

puts "Done! #{User.count} users created."
puts "Done! #{Doctor.count} doctors created"
puts "Done! #{Disease.count} diseases created."
puts "Done! #{Symptom.count} symptoms created."
puts "Done! #{SymptomCheck.count} symptom checks created."
puts "Done! #{Prescription.count} prescriptions created."
puts "Done! #{Chat.count} chats created."
puts "Done! #{Message.count} messages created."
puts "Done! #{Appointment.count} old appintments created."
puts "Done! #{AppointmentSummary.count} appointment summaries created."


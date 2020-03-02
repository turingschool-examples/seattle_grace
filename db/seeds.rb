# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

hospital_1 = Hospital.create!(name: "Grey Sloan Memorial Hospital")
hospital_2 = Hospital.create!(name: "Pacific Northwest General Hospital")
hospital_3 = Hospital.create!(name: "New York Hospital")
hospital_4 = Hospital.create!(name: "Seattle Grace Hospital")
doctor_1 = hospital_1.doctors.create!(name: "Meredith Grey", specialty: "General Surgery", education: "Harvard University")
doctor_2 = hospital_2.doctors.create!(name: "Alex Karev", specialty: "Pediatric Surgery", education: "Johns Hopkins University")
doctor_3 = hospital_3.doctors.create!(name: "Miranda Bailey", specialty: "General Surgery", education: "Stanford University")
doctor_4 = hospital_4.doctors.create!(name: "Derek Webber", specialty: "Attending Surgeon", education: "University of Pennsylvania")
patient_1 = Patient.create!(name: "Katie Bryce", age: 24)
patient_2 = Patient.create!(name: "Denny Duquette", age: 39)
patient_3 = Patient.create!(name: "Rebecca Pope", age: 32)
patient_3 = Patient.create!(name: "Zola Shepherd", age: 2)
doctor_1.patients << patient_1
doctor_1.patients << patient_2
doctor_2.patients << patient_2
doctor_3.patients << patient_3
doctor_3.patients << patient_4
doctor_3.patients << patient_4

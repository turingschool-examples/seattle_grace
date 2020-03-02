# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
DoctorPatient.destroy_all
Patient.destroy_all
Doctor.destroy_all
Hospital.destroy_all
hospital1 = Hospital.create!(name: 'Hospital in Denver')
hospital2 = Hospital.create!(name: 'Hospital in Boulder')
doctor1 = hospital1.doctors.create!(name: 'John', specialty: 'Surgeon', university: 'Harvard')
doctor2 = hospital2.doctors.create!(name: 'Steve', specialty: 'Adults', university: 'Yale')
doctor3 = hospital2.doctors.create!(name: 'Chris', specialty: 'Children', university: 'Yale')
doctor4 = hospital2.doctors.create!(name: 'Larry', specialty: 'Life', university: 'Stanford')
doctor5 = hospital2.doctors.create!(name: 'Susie', specialty: 'All Duties', university: 'Yale')
patient1 = doctor1.patients.create!(name: 'Christian', age: 28)
patient4 = doctor1.patients.create!(name: 'Mike', age: 31)
patient5 = doctor1.patients.create!(name: 'Hannah', age: 37)
patient2 = doctor2.patients.create!(name: 'Tanner', age: 26)
patient3 = doctor2.patients.create!(name: 'Megan', age: 22)
patient2 = doctor2.patients.create!(name: 'Sally', age: 42)

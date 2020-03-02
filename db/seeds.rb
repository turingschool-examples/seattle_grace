# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

hospital1 = Hospital.create(name: "Sacred Heart")
hospital2 = Hospital.create(name: "Swedish")
hospital3 = Hospital.create(name: "Kaiser")

doctor1 = Doctor.create(name: "Turk", specialty: "Surgery", university: "Colorado University", hospital: hospital1)
doctor2 = Doctor.create(name: "Carla", specialty: "Nursing", university: "New Jersey University", hospital: hospital1)
doctor3 = Doctor.create(name: "JD", specialty: "Doctor", university: "Nowhere University", hospital: hospital1)

doctor4 = Doctor.create(name: "Ana", specialty: "Blood", university: "University of Washington", hospital: hospital2)
doctor5 = Doctor.create(name: "Betty", specialty: "X Ray", university: "LA", hospital: hospital2)
doctor6 = Doctor.create(name: "Conner", specialty: "General Medicin", university: "Somwhere University", hospital: hospital2)

doctor7 = Doctor.create(name: "Ian", specialty: "Gastro", university: "Oregon University", hospital: hospital3)
doctor8 = Doctor.create(name: "Katie", specialty: "Bones", university: "San Francisco University", hospital: hospital3)
doctor9 = Doctor.create(name: "James", specialty: "Spit", university: "Unhappy University", hospital: hospital3)

patient1 = Patient.create!(name: 'Zola  Shepherd', age: 2)

patient2 = Patient.create!(name: 'Rebecca Pope', age: 32)
patient3 = Patient.create!(name: 'Denny Duquette', age: 39)
patient4 = Patient.create!(name: 'Katie Bryce', age: 24)

doctor1.patients << patient1
doctor1.patients << patient2

doctor2.patients << patient3
doctor2.patients << patient4

doctor3.patients << patient1
doctor3.patients << patient2

doctor4.patients << patient3
doctor4.patients << patient4

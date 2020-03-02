# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
hospital = Hospital.create(name: "Grey Sloan Memorial Hospital")

doctor = hospital.doctors.create(name: "Meredith Grey", specialty: "General Surgery", university: "Harvard University")

patient_1 = doctor.patients.create(name: "Katie Bryce", age: 24)
patient_2 = doctor.patients.create(name: "Denny Duquette", age: 39)

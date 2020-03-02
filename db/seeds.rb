# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
hospital_1 = Hospital.create(
  name: "Denver Hospital"
  )

doctor_1 = Doctor.create!(
    name: "Dr. Nick",
    specialty: "Hips",
    university: "Harvard",
    hospital: hospital_1
  )

doctor_2 = Doctor.create!(
    name: "Dr. Sally",
    specialty: "Backs",
    university: "Stanford",
    hospital: hospital_1
  )

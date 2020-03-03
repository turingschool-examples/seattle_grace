# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
      hospital_1 = Hospital.create!(name: "IU Health")

      doctor_1 = hospital_1.doctors.create!(name: "Jordan Sewell", specialty: "General", university: "IU")
      doctor_2 = hospital_1.doctors.create!(name: "Hilary Sewell", specialty: "ENT", university: "Brown")

      surgery_1 = Surgery.create!(title: "Face", day_of_week: "Monday", operating_room_number: 70)
      surgery_2 = Surgery.create!(title: "Back", day_of_week: "Monday", operating_room_number: 7)
      surgery_3 = Surgery.create!(title: "Leg", day_of_week: "Monday", operating_room_number: 100)
      surgery_4 = Surgery.create!(title: "Arm", day_of_week: "Tuesday", operating_room_number: 30)

      doctor_1.surgeries << surgery_1
      doctor_1.surgeries << surgery_2
      doctor_1.surgeries << surgery_3
      doctor_1.surgeries << surgery_4

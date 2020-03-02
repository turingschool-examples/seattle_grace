# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Doctor.destroy_all
Hospital.destroy_all
Patient.destroy_all

hs1 = Hospital.create!(name: "Johns Hopkins")
hs2 = Hospital.create!(name: "Hope")
dr1 = hs1.doctors.create!(name: "Matt", specialty: "brains", university: "GVSU", )
dr2 = hs2.doctors.create!(name: "Meghan", specialty: "holistics", university: "Community College")
pt1 = dr1.patients.create!(name: "Kathleen", age: 10)
pt2 = dr1.patients.create!(name: "Zeke", age: 20)
pt3 = dr2.patients.create!(name: "Meg", age: 20)

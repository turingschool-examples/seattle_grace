# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


hos1 = Hospital.create(name: "St. Marry's")
hos2 = Hospital.create(name: "St. Joseph's")
hos3 = Hospital.create(name: "St. John's")

dr1 = hos1.doctors.create(name: "Marry", specialty: "Brain Surgen", university: "Denver University")
dr2 = hos1.doctors.create(name: "Matt", specialty: "Knee replacments", university: "Arizona State University")
dr3 = hos1.doctors.create(name: "Mike", specialty: "Foot Surgen", university: "Arizona State University")
dr4 = hos2.doctors.create(name: "Joseph", specialty: "NP", university: "Colorado University")
dr5 = hos2.doctors.create(name: "Zeke", specialty: "Eastern medicine", university: "Community College")
dr6 = hos2.doctors.create(name: "Meg", specialty: "Foot Surgen", university: "Community College")
dr7 = hos3.doctors.create(name: "Tom", specialty: "NP", university: "Colorado University")
dr8 = hos3.doctors.create(name: "Jordan", specialty: "Knee replacements", university: "Arizona State University")
dr9 = hos3.doctors.create(name: "Benjamen", specialty: "Brian Surgen", university: "Arizona State University")

pat1 = dr1.patients.create(name: "Ben", age: 25)
pat2 = dr1.patients.create(name: "George", age: 40)
pat3 = dr1.patients.create(name: "Sally", age: 30)
pat4 = dr2.patients.create(name: "Carl", age: 32)
pat5 = dr2.patients.create(name: "Ryan", age: 30)
pat6 = dr3.patients.create(name: "Joe", age: 45)
pat7 = dr4.patients.create(name: "Jogn", age: 50)
pat8 = dr4.patients.create(name: "Bert", age: 62)
pat9 = dr4.patients.create(name: "Betty", age: 45)
pat10 = dr5.patients.create(name: "Carol", age: 43)
pat11 = dr5.patients.create(name: "Jacob", age: 15)
pat12 = dr6.patients.create(name: "Nancy", age: 60)
pat13 = dr7.patients.create(name: "Nelly", age: 20)
pat14 = dr8.patients.create(name: "Nathan", age: 24)

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# hospitals have many doctors
# doctors belong to a hospital


dr1 = Doctor.create(name: "Marry", specialty: "Brain Surgen", university: "DU")
dr2 = Doctor.create(name: "Joseph", specialty: "NP", university: "CU")
dr3 = Doctor.create(name: "Tom", specialty: "Liver", university: "CSU")
dr4 = Doctor.create(name: "Matt", specialty: "Knee replacments", university: "ASU")
dr5 = Doctor.create(name: "Zeke", specialty: "Eastern medicine", university: "community college")
dr6 = Doctor.create(name: "Jordan", specialty: "herbal medicine", university: "ASU")

hos1 = dr1.hospitals.create(name: "St. Marry's")
hos2 = dr2.hospitals.create(name: "St. Joseph's")
hos3 = dr3.hospitals.create(name: "St. John's")

hos1.doctors << dr4
hos2.doctors << dr5
hos3.doctors << dr6

pat1 = Patient.create(name: "Ben", age: 25)
pat2 = Patient.create(name: "George", age: 40)
pat3 = Patient.create(name: "Sally", age: 30)
pat4 = Patient.create(name: "Carl", age: 32)
pat5 = Patient.create(name: "Ryan", age: 30)
pat6 = Patient.create(name: "Joe", age: 45)


# creating a table
# rails g migration CreateName name:string

# adding a one to many relationship
# rails g migration AddArtistToSongs artist:references

# creating a joins table
# rails g migration CreatePlaylistSongs song:references playlist:references

# add timestamps
# rails db:migrate

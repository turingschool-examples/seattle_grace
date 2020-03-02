# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# hospitals have many doctors
# doctors belong to a hospital

hos1 = Hospital.create(name: "St. Marry's") dr1
hos2 = Hospital.create(name: "St. Joseph's") dr2
hos3 = Hospital.create(name: "St. John's") dr3

dr1 = hos1.doctors.create(name: "Marry", specialty: "Brain Surgen", university: "DU")
dr2 = hos2.doctors.create(name: "Joseph", specialty: "NP", university: "CU")
dr3 = hos3.doctors.create(name: "Tom", specialty: "Liver", university: "CSU")
dr4 = hos1.doctors.create(name: "Matt", specialty: "Knee replacments", university: "ASU")
dr5 = hos2.doctors.create(name: "Zeke", specialty: "Eastern medicine", university: "community college")
dr6 = hos3.doctors.create(name: "Jordan", specialty: "herbal medicine", university: "ASU")

pat1 = dr1.patients.create(name: "Ben", age: 25)
pat2 = dr1.patients.create(name: "George", age: 40)
pat3 = dr2.patients.create(name: "Sally", age: 30)
pat4 = dr2.patients.create(name: "Carl", age: 32)
pat5 = dr3.patients.create(name: "Ryan", age: 30)
pat6 = dr4.patients.create(name: "Joe", age: 45)


# creating a table
# rails g migration CreateName name:string

# adding a one to many relationship
# rails g migration AddArtistToSongs artist:references

# creating a joins table
# rails g migration CreatePlaylistSongs song:references playlist:references

# add timestamps
# rails db:migrate

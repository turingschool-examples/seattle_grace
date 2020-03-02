# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Doctor.destroy_all
Hospital.destroy_all

dr1 = Doctor.create!(name: "Matt", specialty: "brains", university: "GVSU")
dr2 = Doctor.create!(name: "Meghan", specialty: "holistics", university: "Community College")
dr3 = Doctor.create!(name: "Cassie", specialty: "shins", university: "UCSB")
dr4 = Doctor.create!(name: "Dave", specialty: "feet", university: "Cal")
dr5 = Doctor.create!(name: "Will", specialty: "muscles", university: "USC")
dr6 = Doctor.create!(name: "Acula", specialty: "blood", university: "UofM")

hs1 = dr1.hospitals.create!(name: "Johns Hopkins")
hs2 = dr2.hospitals.create!(name: "Hope")
hs3 = dr3.hospitals.create!(name: "Arkham Asylum")

hs1.doctors << dr4
hs2.doctors << dr5
hs3.doctors << dr6

pt1 = Patient.create(name: "Kathleen", age: 10)
pt2 = Patient.create(name: "Zeke", age: 20)
pt3 = Patient.create(name: "Jimmy", age: 10)
pt4 = Patient.create(name: "Jenny", age: 20)
pt5 = Patient.create(name: "Nathan", age: 10)
pt6 = Patient.create(name: "Alex", age: 20)

# rails g migration CreateArtists name:string
# Add timestamps
# rails db:migrate
# Rails g migration CreateSongs title:string play_count:integer length:integer artist:references
# Add timestamps
# rails db:migrate
# Rails g migration CreatePlaylistSongs song:references playlist:references
# Add timestamps
# rails db:migrate

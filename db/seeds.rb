# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Patient.destroy_all 
Doctor.destroy_all
Hospital.destroy_all

# hospitals

@north = Hospital.create!(name: "North Hospital")
@south = Hospital.create!(name: "South Hospital")
@west = Hospital.create!(name: "west Hospital")

# doctors

@phil = @north.doctors.create!(name: 'Phil', specialty: "Love", university: "Love School")
@john = @north.doctors.create!(name: 'John', specialty: "Pediactrics", university: "Hampden University")
@hellen = @north.doctors.create!(name: 'Hellen', specialty: "cranial", university: "Colorado State University")

@daniel = @south.doctors.create!(name: "Daniel", specialty: "Cyropractor", university: "Colorado University")
@sherry = @south.doctors.create!(name: "Sherry", specialty: "Vetrinarian", university: "Red Rocks University")
@holly = @south.doctors.create!(name: "Holly", specialty: "Birth", university: "Harvard University")

@matt = @west.doctors.create!(name: "Matt", specialty: "Hand Work", university: "Brown University")
@shawn = @west.doctors.create!(name: "Shawn", specialty: "plastic surgery", university: "California University")
@dillon = @west.doctors.create!(name: "Dillon", specialty: "Necolepcy", university: "Main University")

# patients

@danny = Patient.create!(name: "Danny Moore", age: 35)
@katie = Patient.create!(name: "Katie Bryce", age: 24)
@denny = Patient.create!(name: "Denny Duquette", age: 39)
@rebecca = Patient.create!(name: "Rebecca Pope", age: 32)
@zola = Patient.create!(name: "Zola  Shepherd", age: 2)

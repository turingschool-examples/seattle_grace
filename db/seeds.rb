#doctors
meredith = Doctor.create!(name: "Meredith Grey", specialty: "General Surgery", education: "Harvard University")
alex = Doctor.create!(name: "Alex Karev", specialty: "Pediatric Surgery", education: "Johns Hopkins University")
miranda = Doctor.create!(name: "Miranda Bailey", specialty: "General Surgery", education: "Stanford University")
derek = Doctor.create!(name: "Derek Webber", specialty: "Attending Surgeon", education: "University of Pennsylvania")

#hospitals
grey = Hospital.create!(name: "Grey Sloan Memorial Hospital")
pacific = Hospital.create!(name: "Pacific Northwest General Hospital")
new_york = Hospital.create!(name: "New York Hospital")
seattle = Hospital.create!(name: "Seattle Grace Hospital")

#patients

Name: Katie Bryce
Age: 24
Name: Denny Duquette
Age: 39
Name: Rebecca Pope
Age: 32
Name: Zola  Shepherd
Age: 2
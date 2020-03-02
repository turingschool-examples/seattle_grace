DoctorPatient.destroy_all
Patient.destroy_all
Doctor.destroy_all
Hospital.destroy_all

#hospitals
grey = Hospital.create!(name: "Grey Sloan Memorial Hospital")
pacific = Hospital.create!(name: "Pacific Northwest General Hospital")
new_york = Hospital.create!(name: "New York Hospital")
seattle = Hospital.create!(name: "Seattle Grace Hospital")

#doctors
meredith = grey.doctors.create!(name: "Meredith Grey", specialty: "General Surgery", university: "Harvard University")
alex = grey.doctors.create!(name: "Alex Karev", specialty: "Pediatric Surgery", university: "Johns Hopkins University")
miranda = new_york.doctors.create!(name: "Miranda Bailey", specialty: "General Surgery", university: "Stanford University")
derek = seattle.doctors.create!(name: "Derek Webber", specialty: "Attending Surgeon", university: "University of Pennsylvania")

#patients
katie = meredith.patients.create!(name:"Katie Bryce", age: 24)
denny = meredith.patients.create!(name:"Denny Duquette", age: 39)
rebecca = alex.patients.create!(name:"Rebecca Pope", age: 32)
zola = miranda.patients.create!(name:"Zola Shepherd", age: 2)

#doctor_patients
DoctorPatient.create!(doctor_id: alex.id, patient_id: katie.id)
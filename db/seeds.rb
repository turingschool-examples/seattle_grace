# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Doctors:

meredith = Doctor.create(name: 'Meredith Grey',
                         specialty: 'General Surgery',
                         university: 'Harvard University',
                         hospital: seattle_grace,
                         patients: [denny, katie])

karev = Doctor.create(name: 'Alex Karev',
                        specialty: 'Pediatric Surgery',
                        university: 'Johns Hopkins University',
                        hospital: seattle_grace,
                        patients: [denny, katie])

miranda = Doctor.create(name: 'Miranda Bailey',
                        specialty: 'General Surgery',
                        university: 'Stanford University',
                        hospital: seattle_grace,
                        patients: [denny, katie])

derek = Doctor.create(name: 'Derek Webber',
                        specialty: 'Attending Surgeon',
                        university: 'University of Pennsylvania',
                        hospital: seattle_grace,
                        patients: [denny, katie])

christina = Doctor.create(name: 'Christina Yang',
                       specialty: 'Cardiothoracic Surgery',
                       university: 'Stanford University',
                       hospital: seattle_grace,
                       patients: [denny, katie])
#
# Hospitals:
seattle_grace = Hospital.create(name: 'Seattle Grace Hospital')
#
# Grey Sloan Memorial Hospital
# Pacific Northwest General Hospital
# New York Hospital
# Seattle Grace Hospital
#
# Patients:

katie = Patient.create(name: 'Katie Bryce', age: 24)
denny = Patient.create(name: 'Denny Duquette', age: 39)
rebecca = Patient.create(name: 'Rebecca Pope', age: 32)
zola = Patient.create(name: 'Zola Shepherd', age: 2)

#
# Name: Katie Bryce
# Age: 24
#
# Name: Denny Duquette
# Age: 39
#
# Name: Rebecca Pope
# Age: 32
#
# Name: Zola  Shepherd
# Age: 2

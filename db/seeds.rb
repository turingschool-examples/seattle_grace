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
#
# Name: Meredith Grey
# Specialty: General Surgery
# Education: Harvard University
#
# Name: Alex Karev
# Specialty: Pediatric Surgery
# Education: Johns Hopkins University
#
# Name: Miranda Bailey
# Specialty: General Surgery
# Education: Stanford University
#
# Name: Derek Webber
# Specialty: Attending Surgeon
# Education: University of Pennsylvania
#
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

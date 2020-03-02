require 'rails_helper'

RSpec.describe Hospital, type: :model do
  describe 'validations' do
    it {should validate_presence_of :name}
  end
  describe 'relationships' do
    it {should have_many :doctors}
  end

  it 'educations' do
    seattle_grace = Hospital.create(name: 'Seattle Grace Hospital')
    katie = Patient.create(name: 'Katie Bryce', age: 24)
    denny = Patient.create(name: 'Denny Duquette', age: 39)
    rebecca = Patient.create(name: 'Rebecca Pope', age: 32)
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

    karev2 = Doctor.create(name: 'Alex Karev 2',
                            specialty: 'Pediatric Surgery',
                            university: 'Johns Hopkins University',
                            hospital: seattle_grace,
                            patients: [denny, katie])

    expect(seattle_grace.educations).to eq([meredith.university, karev.university])
  end
end

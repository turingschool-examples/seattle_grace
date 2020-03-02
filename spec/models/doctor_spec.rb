require 'rails_helper'

RSpec.describe Doctor, type: :model do
  describe 'validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :specialty}
    it {should validate_presence_of :university}
  end
  describe 'relationships' do
    it {should belong_to :hospital}
    it {should have_many :patient_doctors}
    it {should have_many(:patients).through(:patient_doctors)}
  end

  it 'remove_patient' do
    seattle_grace = Hospital.create(name: 'Seattle Grace Hospital')
    katie = Patient.create(name: 'Katie Bryce', age: 24)
    denny = Patient.create(name: 'Denny Duquette', age: 39)
    rebecca = Patient.create(name: 'Rebecca Pope', age: 32)
    meredith = Doctor.create(name: 'Meredith Grey',
                             specialty: 'General Surgery',
                             university: 'Harvard University',
                             hospital: seattle_grace,
                             patients: [denny, katie, rebecca])

    meredith.remove(katie.id)
    expect(meredith.patients).to eq([denny, rebecca])
  end
end

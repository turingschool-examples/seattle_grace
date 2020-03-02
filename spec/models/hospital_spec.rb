require 'rails_helper'

RSpec.describe Hospital, type: :model do
  describe 'validations' do
    it {should validate_presence_of :name}
  end

  describe 'relationships' do
    it {should have_many :doctors}
  end

  describe 'instance methods' do
    before :each do
      @hospital = Hospital.create(name: 'Seattle Grace')

      @doctor1 = @hospital.doctors.create(name: 'Meredith Grey',
                                          specialty: 'General Surgery',
                                          university: 'Harvard')

      @doctor2 = @hospital.doctors.create(name: 'Alex Karev',
                                          specialty: 'Pediatric Surgery',
                                          university: 'Johns Hopkins University')

      @doctor3 = @hospital.doctors.create(name: 'Jordan Williams',
                                          specialty: 'General Surgery',
                                          university: 'Harvard')

      @patient1 = @doctor1.patients.create(name: 'Jordan Williams',
                                           age: 37)

      @patient2 = @doctor2.patients.create(name: 'Meredith Williams',
                                           age: 38)

      @patient3 = @doctor3.patients.create(name: 'Magnus Williams',
                                           age: 3)
    end

    it 'doctor_count' do
      expect(@hospital.doctor_count).to eq(3)
    end

    it 'universities' do
      expect(@hospital.universities).to eq(2)
    end
  end
end

RSpec.describe 'As a visitor', type: :feature do
  describe "When I visit a doctor's show page" do
    it 'I can see their name, specialty, and university' do
      hospital = Hospital.create(name: 'Seattle Grace')

      doctor = hospital.doctors.create(name: 'Meredith Grey',
                                      specialty: 'General Surgery',
                                      university: 'Harvard')

      patient1 = doctor.patients.create(name: 'Jordan Williams',
                                        age: 37)

      patient2 = doctor.patients.create(name: 'Meredith Williams',
                                        age: 38)

      visit doctor_path(doctor)

      expect(page).to have_content(doctor.name)
      expect(page).to have_content(doctor.specialty)
      expect(page).to have_content(doctor.university)
      expect(page).to have_content(doctor.hospital.name)
      expect(page).to have_content(patient1.name)
      expect(page).to have_content(patient2.name)
    end
  end
end

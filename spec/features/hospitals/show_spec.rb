RSpec.describe 'As a vistor', type: :feature do
  describe "When I visit a hospital's show page" do
    it "I see the hospital's data" do

      hospital = Hospital.create(name: 'Seattle Grace')

      doctor = hospital.doctors.create(name: 'Meredith Grey',
                                       specialty: 'General Surgery',
                                       university: 'Harvard')

      patient1 = doctor.patients.create(name: 'Jordan Williams',
                                        age: 37)

      patient2 = doctor.patients.create(name: 'Meredith Williams',
                                        age: 38)

      visit hospital_path(hospital)

      expect(page).to have_content(hospital.name)
      expect(page).to have_content(hospital.doctor_count)
      expect(page).to have_content(hospital.universities)
    end
  end
end

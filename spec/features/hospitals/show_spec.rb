RSpec.describe 'As a vistor', type: :feature do
  describe "When I visit a hospital's show page" do
    it "I see the hospital's data" do

      hospital = Hospital.create(name: 'Seattle Grace')

      doctor1 = hospital.doctors.create(name: 'Meredith Grey',
                                       specialty: 'General Surgery',
                                       university: 'Harvard')

      doctor2 = hospital.doctors.create(name: 'Jordan Willimas',
                                       specialty: 'General Surgery',
                                       university: 'Harvard')

      doctor3 = hospital.doctors.create(name: 'Barack Obama',
                                       specialty: 'General Surgery',
                                       university: 'Stanford')

      patient1 = doctor1.patients.create(name: 'Jordan Williams',
                                        age: 37)

      patient2 = doctor2.patients.create(name: 'Meredith Williams',
                                        age: 38)

      visit hospital_path(hospital)

      expect(page).to have_content(hospital.name)
      expect(page).to have_content("Number of doctors: #{hospital.doctor_count}")
      expect(page).to have_content("Universities represented: #{hospital.universities}")
    end
  end
end

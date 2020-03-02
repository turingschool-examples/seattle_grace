RSpec.describe 'As a visitor', type: :feature do
  describe 'When I visit the patients index page' do
    it 'I can see the names of all patients, youngest to oldest' do

      hospital = Hospital.create(name: 'Seattle Grace')

      doctor = hospital.doctors.create(name: 'Meredith Grey',
                                       specialty: 'General Surgery',
                                       university: 'Harvard')

      patient1 = doctor.patients.create(name: 'Jordan Williams',
                                        age: 37)

      patient2 = doctor.patients.create(name: 'Meredith Williams',
                                        age: 38)

      visit patients_path
      save_and_open_page
      within("#patient-#{patient1.id}") do
        expect(page).to have_content(patient1.name)
      end

      within("#patient-#{patient2.id}") do
        expect(page).to have_content(patient2.name)
      end
    end
  end
end

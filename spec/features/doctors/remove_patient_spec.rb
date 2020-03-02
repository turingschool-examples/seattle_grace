RSpec.describe 'As a something', type: :feature do
  describe 'When I do something' do
    it 'it has this outcome' do

      hospital = Hospital.create(name: 'Seattle Grace')

      doctor1 = hospital.doctors.create(name: 'Meredith Grey',
                                       specialty: 'General Surgery',
                                       university: 'Harvard')

      patient1 = doctor1.patients.create(name: 'Jordan Williams',
                                        age: 37)

      patient2 = doctor1.patients.create(name: 'Meredith Williams',
                                        age: 38)

      visit doctor_path(doctor1)

      within("#patient-#{patient1.id}") do
        expect(page).to have_content(patient1.name)
        click_link 'Remove Patient'
      end

      expect(current_path).to eq(doctor_path(doctor1))

      expect(page).to_not have_css("#patient-#{patient1.id}")
    end
  end
end

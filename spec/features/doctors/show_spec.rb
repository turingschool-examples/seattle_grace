require 'rails_helper'

RSpec.describe 'As a visitor to doctor show page' do
  before :each do
    @hospital = Hospital.create!(name: 'Parkland Hospital')
    @tron = @hospital.doctors.create!(name: 'Dr. Tron Kattington', specialty: 'Attending Surgeon', university: 'University of Mind Ya Business')
    @patient1 = @tron.patients.create!(name: 'Joe', age: 20)
    @patient2 = @tron.patients.create!(name: 'Becky', age: 22)
    @patient3 = Patient.create!(name: 'John', age: 20)
  end
  it 'should show a doctors information' do
    visit "/doctors/#{@tron.id}"
    expect(page).to have_content(@tron.name)
    expect(page).to have_content(@tron.specialty)
    expect(page).to have_content(@tron.university)
    expect(page).to have_content(@hospital.name)
    expect(page).to have_content(@patient1.name)
    expect(page).to have_content(@patient2.name)
    expect(page).to_not have_content(@patient3.name)
  end

  it 'should allow patient to be deleted' do
    visit "/doctors/#{@tron.id}"
    expect(page).to have_content(@patient1.name)
    expect(page).to have_content(@patient2.name)
    expect(@tron.patients.count).to eq(2)

    within "#patient-#{@patient1.id}" do
      expect(page).to have_link("Remove Patient")
      click_on "Remove Patient"
    end

    expect(current_path).to eq("/doctors/#{@tron.id}")
    expect(page).to_not have_content(@patient1.name)
    expect(page).to have_content(@patient2.name)
    expect(@tron.patients.count).to eq(1)
  end

end

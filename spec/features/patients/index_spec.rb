require 'rails_helper'

RSpec.describe 'As a visitor to patient index page' do
  before :each do
    @hospital = Hospital.create!(name: 'Parkland Hospital')
    @tron = @hospital.doctors.create!(name: 'Dr. Tron Kattington', specialty: 'Attending Surgeon', university: 'University of Mind Ya Business')
    @patient1 = @tron.patients.create!(name: 'Joe', age: 20)
    @patient2 = @tron.patients.create!(name: 'Becky', age: 22)
    @patient3 = Patient.create!(name: 'John', age: 21)
  end
  it 'should show patients from youngest to oldest' do
    visit "/patients"
    expect(page).to have_content(@patient2.name)
    expect(page).to have_content(@patient3.name)
    expect(page).to have_content(@patient1.name)
  end

end

require 'rails_helper'

RSpec.describe 'As a visitor to hospital show page' do
  before :each do
    @hospital = Hospital.create!(name: 'Parkland Hospital')
    @tron = @hospital.doctors.create!(name: 'Dr. Tron Kattington', specialty: 'Attending Surgeon', university: 'University of Mind Ya Business')
    @kat = @hospital.doctors.create!(name: 'Dr. Katton Tronson', specialty: 'Attending Surgeon', university: 'University of Why You Askin')
    @patient1 = @tron.patients.create!(name: 'Joe', age: 20)
    @patient2 = @tron.patients.create!(name: 'Becky', age: 22)
    @patient3 = @kat.patients.create!(name: 'John', age: 20)
  end
  it 'should show a hospitals information' do
    visit "/hospitals/#{@hospital.id}"
    expect(page).to have_content(@hospital.name)
    expect(page).to have_content("Number of Doctors: 2")
    expect(page).to have_content(@tron.university)
    expect(page).to have_content(@kat.university)
  end

end

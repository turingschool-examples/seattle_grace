require 'rails_helper'

describe 'As a visitor on the hospital show page' do
  before :each do
    @hospital = Hospital.create(name: "Grey Sloan Memorial Hospital")

    @doctor = @hospital.doctors.create(name: "Meredith Grey", specialty: "General Surgery", university: "Harvard University")

    @patient_1 = @doctor.patients.create(name: "Katie Bryce", age: 24)
    @patient_2 = @doctor.patients.create(name: "Denny Duquette", age: 39)

    visit "/hospitals/#{@hospital.id}"
  end

  it "I see the hospital name" do
    expect(page).to have_content("#{@hospital.name}")
  end

end

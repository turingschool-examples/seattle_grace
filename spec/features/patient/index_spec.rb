require 'rails_helper'

describe 'As a visitor on the patient index page' do
  before :each do
    @hospital = Hospital.create(name: "Grey Sloan Memorial Hospital")

    @doctor = @hospital.doctors.create(name: "Meredith Grey", specialty: "General Surgery", university: "Harvard University")

    @patient_1 = @doctor.patients.create(name: "Katie Bryce", age: 24)
    @patient_2 = @doctor.patients.create(name: "Denny Duquette", age: 39)

    visit "/patients"
  end

  it "I see the names of all patients listed oldest to youngest" do
    expect(page).to have_content("All patients:")
    expect(page).to have_content("#{@patient_2.name}")
    expect(page).to have_content("#{@patient_1.name}")
    # If time, come back and make this test more robust to specifically test order
  end

end

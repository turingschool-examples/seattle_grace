require 'rails_helper'

describe 'As a visitor on the doctor show page' do
  before :each do
    @hospital = Hospital.create(name: "Grey Sloan Memorial Hospital")

    @doctor = @hospital.doctors.create(name: "Meredith Grey", specialty: "General Surgery", university: "Harvard University")

    visit "/doctors/#{@doctor.id}"
  end

  it "I see the doctor info" do
    expect(page).to have_content("Doctor Info")
    expect(page).to have_content("Name: #{@doctor.name}")
    expect(page).to have_content("Specialty: #{@doctor.specialty}")
    expect(page).to have_content("Education: #{@doctor.university}")
  end

end

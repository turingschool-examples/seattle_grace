require 'rails_helper'

RSpec.describe 'hospitals show page', type: :feature do
  before :each do
    @hos1 = Hospital.create(name: "St. Marry's")
    @hos2 = Hospital.create(name: "St. Joseph's")
    @hos3 = Hospital.create(name: "St. John's")

    @dr1 = @hos1.doctors.create(name: "Marry", specialty: "Brain Surgen", university: "Denver University")
    @dr4 = @hos1.doctors.create(name: "Matt", specialty: "Knee replacments", university: "ASU")
    @dr5 = @hos1.doctors.create(name: "Tye", specialty: "Blood", university: "ASU")
    @dr2 = @hos2.doctors.create(name: "Joseph", specialty: "NP", university: "Colorado University")
    @dr3 = @hos3.doctors.create(name: "Tom", specialty: "Liver", university: "CSU")

    visit "/hospitals/#{@hos1.id}"
  end

  it "hospital name, number of doctors, and unique list of universities the doctors are from" do
    expect(page).to have_content("Hospital: #{@hos1.name}")
    expect(page).to_not have_content("Hospital: #{@hos2.name}")
    expect(page).to_not have_content("Hospital: #{@hos3.name}")

    expect(page).to have_content("Number of Doctors: 3")
    expect(page).to_not have_content("Number of Doctors: 1")

    expect(page).to have_content(@dr1.university)
    expect(page).to have_content(@dr4.university)
    expect(page).to_not have_content("Colorado University")
  end
end

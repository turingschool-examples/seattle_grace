require 'rails_helper'

RSpec.describe 'patients index page', type: :feature do
  before :each do
    @hos1 = Hospital.create(name: "St. Marry's")
    @hos2 = Hospital.create(name: "St. Joseph's")
    @hos3 = Hospital.create(name: "St. John's")

    @dr1 = @hos1.doctors.create(name: "Marry", specialty: "Brain Surgen", university: "Denver University")
    @dr2 = @hos2.doctors.create(name: "Joseph", specialty: "NP", university: "Colorado University")
    @dr3 = @hos3.doctors.create(name: "Tom", specialty: "Liver", university: "CSU")
    @dr4 = @hos1.doctors.create(name: "Matt", specialty: "Knee replacments", university: "ASU")

    @pat1 = @dr1.patients.create(name: "Ben", age: 25)
    @pat2 = @dr1.patients.create(name: "George", age: 40)
    @pat3 = @dr2.patients.create(name: "Sally", age: 30)
    @pat4 = @dr2.patients.create(name: "Carl", age: 32)
    @pat5 = @dr3.patients.create(name: "Ryan", age: 30)
    @pat6 = @dr4.patients.create(name: "Joe", age: 45)

    visit "/patients"
  end

  it "can see name of all patients from oldest to youngest" do
    expect(page).to have_content("#{@pat6.name} (#{@pat6.age})")
    expect(page).to have_content("#{@pat2.name} (#{@pat2.age})")
    expect(page).to have_content("#{@pat4.name} (#{@pat4.age})")
    expect(page).to have_content("#{@pat5.name} (#{@pat5.age})")
    expect(page).to have_content("#{@pat3.name} (#{@pat3.age})")
    expect(page).to have_content("#{@pat1.name} (#{@pat1.age})")
  end
end

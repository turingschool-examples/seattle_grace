require 'rails_helper'

RSpec.describe 'doctors show page', type: :feature do
  before :each do
    @hos1 = Hospital.create(name: "St. Marry's")
    @hos2 = Hospital.create(name: "St. Joseph's")

    @dr1 = @hos1.doctors.create(name: "Marry", specialty: "Brain Surgen", university: "Denver University")
    @dr2 = @hos2.doctors.create(name: "Joseph", specialty: "NP", university: "Colorado University")

    @pat1 = @dr1.patients.create(name: "Ben", age: 25)
    @pat2 = @dr1.patients.create(name: "George", age: 40)
    @pat3 = @dr2.patients.create(name: "Sally", age: 30)

    visit "/doctors/#{@dr1.id}"
  end

  it "can see all doctor info including hospital and patients" do
    expect(page).to have_content("Doctor: #{@dr1.name}")
    expect(page).to have_content("Specialty: #{@dr1.specialty}")
    expect(page).to have_content("Education: #{@dr1.university}")

    expect(page).to_not have_content("Doctor: #{@dr2.name}")

    expect(page).to have_content("Hospital: #{@hos1.name}")
    expect(page).to_not have_content("Hospital: #{@hos2.name}")

    expect(page).to have_content(@pat1.name)
    expect(page).to have_content(@pat2.name)
    expect(page).to_not have_content(@pat3.name)
  end

  it "has button to remove patient by every one" do
    within "#patient-#{@pat1.id}" do
      has_link? "Remove"
    end

    within "#patient-#{@pat2.id}" do
      click_link "Remove"
      expect(current_path).to eq("/doctors/#{@dr1.id}")
    end

    expect(page).to have_content(@pat1.name)
    expect(page).to_not have_content(@pat2.name)
    expect(page).to_not have_content(@pat3.name)
  end
end

require 'rails_helper'

RSpec.describe "As a visitor" do
  before :each do

    @abby = Patient.create(name: "Abby Gallant", age: 32)
    @brooke = Patient.create(name: "Brooke Webb", age: 33)
    @kayla = Patient.create(name: "Kayla Clark", age: 34)

    visit "/patients"
  end

  it "shows the patients on the index page from oldest to youngest" do

    within"#patient-#{@abby.id}" do
      expect(page).to have_content(@abby.name)
    end

    within"#patient-#{@brooke.id}" do
      expect(page).to have_content(@brooke.name)
    end

    within"#patient-#{@kayla.id}" do
      expect(page).to have_content(@kayla.name)
    end
  end
end

# User Story 2, Patient Index Page
# ​
# As a visitor
# When I visit the patient index page
# I see the names of all patients listed from oldest to youngest

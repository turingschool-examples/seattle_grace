require 'rails_helper'

RSpec.describe 'From patients index page' do
  it "sees names of all patients from oldest to youngest" do
    katie = Patient.create(name: 'Katie Bryce', age: 24)
    denny = Patient.create(name: 'Denny Duquette', age: 39)
    rebecca = Patient.create(name: 'Rebecca Pope', age: 32)
    zola = Patient.create(name: 'Zola Shepherd', age: 2)

    visit '/patients'

    expect(page).to have_content("#{denny.name}")
    expect(page).to have_content("#{rebecca.name}")
    expect(page).to have_content("#{katie.name}")
    expect(page).to have_content("#{zola.name}")
  end
end

require 'rails_helper'

RSpec.describe "shelters index page", type: :feature do
  it "can see the name of each shelter in the system" do
    shelter_1 = Shelter.create(name: "Henry's Shelter")
    shelter_2 = Shelter.create(name: "Porter's Puppies")

    visit "/shelters"

    expect(page).to have_content(shelter_1.name)
    expect(page).to have_content(shelter_2.name)
  end

  it "can click clink to create a new shelter", type: :feature do
    visit "/shelters"
    click_link "New Shelter"

    expect(page).to have_current_path("/shelters/new")
  end
end

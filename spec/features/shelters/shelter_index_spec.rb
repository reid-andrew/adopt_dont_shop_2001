require 'rails_helper'

RSpec.describe "SHELTERS index page - A user", type: :feature do
  it "can see the name of each shelter in the system" do
    shelter_1 = Shelter.create( name: "Henry Porter's Puppies",
                                address: "1315 Monaco Parkway",
                                city: "Denver",
                                state: "CO",
                                zip: "80220"
                              )
    shelter_2 = Shelter.create( name: "Holly's Homeless Animals",
                                address: "55400 Township Rd 456",
                                city: "Coshocton",
                                state: "OH",
                                zip: "43812"
                              )

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

require 'rails_helper'

RSpec.describe "shelter show page", type: :feature do
  it "can see the details of a specific shelter" do
    shelter_1 = Shelter.create( id: 1,
                                name: "Henry Porter's Puppies",
                                address: "1315 Monaco Parkway",
                                city: "Denver",
                                state: "CO",
                                zip: "80220"
                              )

    visit "/shelters/1"

    expect(page).to have_content(shelter_1.name)
    expect(page).to have_content(shelter_1.address)
    expect(page).to have_content(shelter_1.city)
    expect(page).to have_content(shelter_1.state)
    expect(page).to have_content(shelter_1.zip)
  end
end

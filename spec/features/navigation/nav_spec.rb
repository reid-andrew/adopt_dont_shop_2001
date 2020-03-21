require 'rails_helper'

RSpec.describe "PETS show page - A user", type: :feature do
  before(:each) do
    @shelter_1 = Shelter.create( name: "Henry Porter's Puppies",
                                address: "1315 Monaco Parkway",
                                city: "Denver",
                                state: "CO",
                                zip: "80220"
                              )
    @pet_1 = Pet.create( name: "Karl Barx",
                        age: 4,
                        sex: "Male",
                        shelter_id: @shelter_1.id,
                        image: 'hp.jpg',
                        adoptable_status: 'Adoptable',
                        description: "He's the cutest!")
  end
  it "can nav to pets index" do
    visit "/pets"
    within("nav") do
      click_link "All Pets"
    end

    expect(page).to have_current_path("/pets")

    visit "/shelters/1/pets/new"
    within("nav") do
      click_link "All Pets"
    end

    expect(page).to have_current_path("/pets")

    visit "/pets/#{@pet_1.id}"
    within("nav") do
      click_link "All Pets"
    end

    expect(page).to have_current_path("/pets")

    visit "/pets/#{@pet_1.id}/edit"
    within("nav") do
      click_link "All Pets"
    end

    expect(page).to have_current_path("/pets")
  end

  it "can nav to shelters index" do
    visit "/shelters"
    within("nav") do
      click_link "All Shelters"
    end

    expect(page).to have_current_path("/shelters")

    visit "/shelters/new"
    within("nav") do
      click_link "All Shelters"
    end

    expect(page).to have_current_path("/shelters")

    visit "/shelters/#{@shelter_1.id}"
    within("nav") do
      click_link "All Shelters"
    end

    expect(page).to have_current_path("/shelters")

    visit "/shelters/#{@shelter_1.id}/edit"
    within("nav") do
      click_link "All Shelters"
    end

    expect(page).to have_current_path("/shelters")

    visit "/shelters/#{@shelter_1.id}/pets"
    within("nav") do
      click_link "All Shelters"
    end

    expect(page).to have_current_path("/shelters")
  end
end

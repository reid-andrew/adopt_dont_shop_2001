require 'rails_helper'

RSpec.describe "shelters index page", type: :feature do
  it "can see the name and info of each pet in the system" do
    shelter_1 = Shelter.create( name: "Henry Porter's Puppies",
                                address: "1315 Monaco Parkway",
                                city: "Denver",
                                state: "CO",
                                zip: "80220"
                              )
    pet_1 = Pet.create( name: "Henry",
                        age: 4,
                        sex: "Male",
                        shelter_id: shelter_1)
    pet_2 = Pet.create( name: "Liza Bear",
                        age: 16,
                        sex: "Female",
                        shelter_id: shelter_1)

    visit "/pets"

    expect(page).to have_content(pet_1.name)
    expect(page).to have_content(pet_2.name)
    expect(page).to have_content(pet_1.age)
    expect(page).to have_content(pet_2.age)
    expect(page).to have_content(pet_1.sex)
    expect(page).to have_content(pet_2.sex)
    # expect(page).to have_content(shelter_1.name)
    # expect(page).to have_content(pet_1.image)
    # expect(page).to have_content(pet_2.image)
  end

end

require 'rails_helper'

RSpec.describe "pets index page", type: :feature do
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
                        shelter_id: shelter_1.id,
                        image_path: 'hp.jpg',
                        adoptable_status: 'Adoptable')
    pet_2 = Pet.create( name: "Liza Bear",
                        age: 16,
                        sex: "Female",
                        shelter_id: shelter_1.id,
                        image_path: 'hp2.jpg',
                        adoptable_status: 'Adoptable')

    visit "/pets"

    expect(page).to have_content(pet_1.name)
    expect(page).to have_content(pet_2.name)
    expect(page).to have_content(pet_1.age)
    expect(page).to have_content(pet_2.age)
    expect(page).to have_content(pet_1.sex)
    expect(page).to have_content(pet_2.sex)
    expect(page).to have_css("img[src='/assets/hp-606612a36d3cc16d901e74616fbd73a568030910d171797aa44123d55a9bfa70.jpg']")
    expect(page).to have_css("img[src='/assets/hp2-d54ec5938e641f10459be7bdba8fbb7fed849ec44ba2d1ed8568773d69bd164d.jpg']")
  end

end

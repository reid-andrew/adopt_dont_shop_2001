require 'rails_helper'

describe Shelter, type: :model do
  describe "relationships" do
    it {should have_many :pets}
  end

  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :address}
    it {should validate_presence_of :city}
    it {should validate_presence_of :state}
    it {should validate_presence_of :zip}
  end

  describe "model methods" do
    it "- A shelter has adoptable pets" do
      shelter_1 = Shelter.create( name: "Henry Porter's Puppies",
                                  address: "1315 Monaco Parkway",
                                  city: "Denver",
                                  state: "CO",
                                  zip: "80220"
                                )
      pet_1 = Pet.create( name: "Holly",
                          age: 4,
                          sex: "Male",
                          shelter_id: shelter_1.id,
                          image_path: 'hp.jpg',
                          description: 'Cute',
                          adoptable_status: 'Adoptable')
      pet_2 = Pet.create( name: "Liza",
                          age: 16,
                          sex: "Female",
                          shelter_id: shelter_1.id,
                          image_path: 'hp2.jpg',
                          description: 'Cute',
                          adoptable_status: 'Pending Adoption')
      pet_3 = Pet.create( name: "Feather",
                          age: 5,
                          sex: "Female",
                          shelter_id: shelter_1.id,
                          image_path: 'hp2.jpg',
                          description: 'Cute',
                          adoptable_status: 'Adoptable')

      expect(shelter_1.adoptable_pets).to include(pet_1)
      expect(shelter_1.adoptable_pets).to include(pet_3)
      expect(shelter_1.adoptable_pets).not_to include(pet_2)
    end
  end
end

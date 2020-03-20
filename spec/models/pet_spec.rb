require 'rails_helper'

describe Pet, type: :model do
  describe "relationships" do
    it {should belong_to :shelter}
  end

  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :age}
    it {should validate_presence_of :sex}
    it {should validate_presence_of :description}
    it {should validate_presence_of :image_path}
    it {should validate_presence_of :adoptable_status}
  end

  describe "model methods" do
    it "knows the name of the shelter it lives in" do
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

      expect(pet_1.shelter_name).to eq("Henry Porter's Puppies")
    end
  end
end

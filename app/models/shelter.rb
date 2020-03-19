class Shelter < ApplicationRecord
  has_many :pets

  def adoptable_pets
    pets.select { |pet| pet.adoptable_status == "Adoptable"}
  end
end

class Pet < ApplicationRecord
  belongs_to :shelter
  validates_presence_of :name, :age, :sex, :description, :image_path, :adoptable_status
  
  def shelter_name
    shelter.name
  end
end

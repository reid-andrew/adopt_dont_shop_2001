class Pet < ApplicationRecord
  belongs_to :shelter

  def shelter_name
    shelter.name
  end
end

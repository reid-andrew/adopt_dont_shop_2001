require 'rails_helper'

describe Shelter, type: :model do
  describe "validations" do
    it {should have_many :pets}
  end
end

class SheltersController < ApplicationController

  def index
    @shelters = Shelter.all
  end

  def show
    @shelter = Shelter.find(params[:id])
  end

  def new; end

  def create
    shelter = Shelter.new({
                    name: params["Name"],
                    address: params["Address"],
                    city: params["City"],
                    state: params["State"],
                    zip: params["ZIP Code"]
                  })
    shelter.save
    redirect_to "/shelters/#{shelter.id}"
  end

  def edit; end
end

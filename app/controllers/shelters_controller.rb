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

  def edit
    @shelter = Shelter.find(params[:id])
  end

  def update
    shelter = Shelter.find(params[:id])
    shelter[:name] = params["Name"]
    shelter[:address] = params["Address"]
    shelter[:city] = params["City"]
    shelter[:state] = params["State"]
    shelter[:zip] = params["ZIP Code"]
    shelter.save
    redirect_to "/shelters/#{shelter.id}"
  end

end

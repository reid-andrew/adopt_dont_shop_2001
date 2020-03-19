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
                    name: create_params[:name],
                    address: create_params[:address],
                    city: create_params[:city],
                    state: create_params[:state],
                    zip: create_params[:zip]
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

  def destroy
    Shelter.destroy(params[:id])
    redirect_to "/shelters"
  end

  private

  def create_params
    params.permit(:name, :address, :city, :state, :zip)
  end

end

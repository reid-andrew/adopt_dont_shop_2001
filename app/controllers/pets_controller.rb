class PetsController < ApplicationController

  def index
    @pets = Pet.all
  end

  def new; end

  def create
    pet = Pet.new({
                    name: create_params[:name],
                    age: create_params[:age],
                    sex: create_params[:sex],
                    description: create_params[:description],
                    image_path: create_params[:image_path],
                    adoptable_status: "Adoptable",
                    shelter_id: create_params[:id]
                  })
    pet.save
    redirect_to "/shelters/#{create_params[:id]}/pets"
  end

  def show
    @pet = Pet.find(params[:id])
  end

  private

  def create_params
    params.permit(:name, :age, :sex, :description, :image_path, :id)
  end
end

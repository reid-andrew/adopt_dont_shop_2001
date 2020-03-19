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

  def edit
    @pet = Pet.find(params[:id])
  end

  def update
    pet = Pet.find(params[:id])
    pet[:name] = update_params[:name]
    pet[:age] = update_params[:age]
    pet[:sex] = update_params[:sex]
    pet[:description] = update_params[:description]
    pet[:image_path] = update_params[:image_path]
    pet.save
    redirect_to "/pets/#{pet.id}"
  end

  private

  def create_params
    params.permit(:name, :age, :sex, :description, :image_path, :id)
  end

  def update_params
    params.permit(:name, :age, :sex, :description, :image_path)
  end
end

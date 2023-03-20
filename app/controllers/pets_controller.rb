class PetsController < ApplicationController
  before_action :authenticate_user

  def index
    @pets = current_user.pets.where(user_id: current_user.id)
  end

  def show
    @pet = Pet.find(params[:id])
  end

  def new
    @pet = Pet.new
  end

  def create
    @pet = Pet.new(pet_params)
    @pet.user_id = current_user.id

    if @pet.save
      redirect_to @pet
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @pet = Pet.find(params[:id])
  end

  def update
    @pet = Pet.find(params[:id])

    if @pet.update(pet_params)
      redirect_to @pet
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    # @pet = Pet.find(params[:id])
    @pet = current_user.pets.find(params[:id])
    @pet.destroy

    redirect_to root_path, status: :see_other
  end

  private

  def pet_params
    params.require(:pet).permit(:name, :breed, :image)
  end
end

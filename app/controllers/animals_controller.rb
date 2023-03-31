class AnimalsController < ApplicationController
    def index
        animals = Animal.all
        render json: animals
    end

    def create
        animal = Animal.create(animal_params)
        if animal.valid?
            render json: animal
        else
            render json: animal.errors, status: :unprocessable_entity
        end
    end

    def show
        animal = Animal.find(params[:id])
        render json: animal, include: [:sightings]
    end
    def update
        animal = Animal.find(params[:id])
        animal.update(animal_params)
        if animal.valid?
            render json: animal
        else 
            render json: animal.errors
        end
    end
    def destroy
        animal = Animal.find(params[:id])
        animal.destroy
        if animal.destroy
            render json: animal
        else
            render json: animal.errors, status: :unprocessable_entity
        end
    end

    private
    def animal_params
        params.require(:animal).permit(:name, :scientific_name, sightings_attributes: [:longitude, :latitude, :date])        
    end
end

class PlantTagsController < ApplicationController
  # Where we display the form
  def new
    # plantwebsite.com/plants/:plant_id/plant_tags/new

    # 1. Get the plant from the database
    @plant     = Plant.find(params[:plant_id])
    @plant_tag = PlantTag.new
    @tags      = Tag.all
  end

  # Where we POST the data of the form
  def create
    @tag             = Tag.find(plant_tag_params[:tag])
    @plant_tag       = PlantTag.new(tag: @tag)
    @plant           = Plant.find(params[:plant_id])
    @plant_tag.plant = @plant

    @plant_tag.save

    redirect_to garden_plants_path(@plant.garden)
  end

  private

  def plant_tag_params
    params.require(:plant_tag).permit(:tag)
  end
end

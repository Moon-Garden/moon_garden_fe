class PlantsController < ApplicationController
  def search
    @garden_id = params[:id]
    @results = PlantFacade.search_plant_data(params[:search])
  end

  def create
    data = {
      "user_id": session[:user_id],
      "garden_id": params[:id],
      "name": params[:plant_name],
      "plant_id": params[:plant_api_id]
    }

    PlantTrackingFacade.create_plant(data)
    redirect_to "/gardens/#{params[:id]}"
  end

  def destroy
    PlantTrackingFacade.destroy_plant(session[:user_id], params[:id], params[:plant_id])
    redirect_to "/gardens/#{params[:id]}"
  end

  def edit
    @garden_id = params[:id]
    @plant_id = params[:plant_id]
    @plant = params.permit(:date_planted,
                            :moon_phase,
                            :bounty_amount,
                            :pruning_behaviors,
                            :notes)
  end 

  def update
    data = {
      "date_planted": params[:date_planted],
      "moon_phase": params[:moon_phase],
      "bounty_amount": params[:bounty_amount],
      "pruning_behaviors": params[:pruning_behaviors],
      "notes": params[:notes]

    }

    PlantTrackingFacade.edit_plant(session[:user_id], params[:id], params[:plant_id], data)
    redirect_to "/gardens/#{params[:id]}"
  end
end

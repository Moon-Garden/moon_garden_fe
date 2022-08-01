class PlantTracking
  attr_reader :id,
              :name,
              :date_matured,
              :date_planted,
              :moon_phase,
              :bounty_amount,
              :pruning_behaviors,
              :notes
  def initialize(plant_params)
    # binding.pry
    @id = plant_params[:id]
    @name = plant_params[:attributes][:name]
    @date_matured = plant_params[:attributes][:date_matured].to_s
    @date_planted = plant_params[:attributes][:date_planted].to_s
    @moon_phase = plant_params[:attributes][:moon_phase]
    @bounty_amount = plant_params[:attributes][:bounty_amount]
    @pruning_behaviors = plant_params[:attributes][:pruning_behaviors]
    @notes = plant_params[:attributes][:notes]
  end
end

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
    @id = plant_params[:data][:id]
    @name = plant_params[:data][:attributes][:name]
    @date_matured = plant_params[:data][:attributes][:date_matured].to_s
    @date_planted = plant_params[:data][:attributes][:date_planted].to_s
    @moon_phase = plant_params[:data][:attributes][:moon_phase]
    @bounty_amount = plant_params[:data][:attributes][:bounty_amount]
    @pruning_behaviors = plant_params[:data][:attributes][:pruning_behaviors]
    @notes = plant_params[:data][:attributes][:notes]
  end
end

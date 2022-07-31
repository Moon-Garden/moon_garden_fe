class PlantTracking
  attr_reader :name,
              :date_matured,
              :date_planted,
              :moon_phase,
              :bounty_amount,
              :pruning_behaviors,
              :notes
  def initialize(plant_params)
    @name = plant_params[:name]
    @date_matured = plant_params[:date_matured].to_s
    @date_planted = plant_params[:date_planted].to_s
    @moon_phase = plant_params[:moon_phase]
    @bounty_amount = plant_params[:bounty_amount]
    @pruning_behaviors = plant_params[:pruning_behaviors]
    @notes = plant_params[:notes]
  end
end
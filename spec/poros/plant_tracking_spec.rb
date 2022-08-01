require 'rails_helper'

RSpec.describe PlantTracking do
  it 'exists and has attributes' do
    plant_params =
      {

        "id": '4',
        "attributes":
        {
        "name": 'Carrot',
        "plant_id": 'sae2340987dage',
        "moon_phase": 'waxing crescent',
        "date_planted": Date.today,
        "date_matured": Date.today,
        "bounty_amount": 23,
        "pruning_behaviors": 'No pruning, only thinning',
        "notes": 'Magic carrots matured on the same day they were planted!'
        }
      }

    plant = PlantTracking.new(plant_params)

    expect(plant).to be_an_instance_of(PlantTracking)
    expect(plant.name).to eq('Carrot')
    expect(plant.date_matured).to eq(Date.today.to_s)
    expect(plant.date_planted).to eq(Date.today.to_s)
    expect(plant.moon_phase).to eq('waxing crescent')
    expect(plant.bounty_amount).to eq(23)
    expect(plant.pruning_behaviors).to eq('No pruning, only thinning')
    expect(plant.notes).to eq('Magic carrots matured on the same day they were planted!')
  end
end

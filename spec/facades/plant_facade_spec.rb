require 'rails_helper'

RSpec.describe PlantFacade do
  describe '#search_plant_data(keyword)' do
    it 'search for plant and return 5 results', :vcr do
      keyword = 'basil'

      results = PlantFacade.search_plant_data(keyword)

      expect(results).to be_a(Array)
      expect(results).to be_all(Plant)
      expect(results.count).to eq(5)
    end

    it 'gives me a plant when I pass in a id', :vcr do
      id = '543c216c3938620002020000'

      plant = PlantFacade.get_plant_data(id)

      expect(plant).to be_a(Plant)
    end
  end
end

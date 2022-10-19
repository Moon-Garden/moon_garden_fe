require 'rails_helper'

RSpec.describe LandFacade do
  context '#get_land_data' do
    it 'returns land objects', :vcr do
      ll = '42.588079,-87.822877'
      lands = LandFacade.get_land_data(ll)

      expect(lands).to be_an Array
      expect(lands.first).to be_a Land
      expect(lands.first.name).to eq('Dakhóta (Eastern Dakota)')
      expect(lands.first.description).to eq('https://native-land.ca/maps/languages/dakhota/')
      expect(lands[1].name).to eq('Dakȟóta (Western Dakota)')
      expect(lands[1].description).to eq('https://native-land.ca/maps/languages/dakhota-2/')
    end
  end
end

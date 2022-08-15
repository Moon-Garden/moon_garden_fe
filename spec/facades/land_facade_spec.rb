require 'rails_helper'

RSpec.describe LandFacade do
  context '#get_land_data' do
    it 'returns land objects', :vcr do
      ll = '42.588079,-87.822877'
      lands = LandFacade.get_land_data(ll)

      expect(lands).to be_an Array
      expect(lands.first).to be_a Land
      expect(lands.first.name).to be_a String
      expect(lands.first.description).to be_a String
      expect(lands[1].name).to be_a String
      expect(lands[1].description).to be_a String
    end
  end
end
require 'rails_helper'

RSpec.describe 'land service' do
  context 'get_land_data' do
    it 'returns polygon map data', :vcr do
      lat = '38.892062'
      lng = '-77.019912'
      
      response = LandService.get_land_data(lat, lng)
      expect(response).to be_an Array
      expect(response.first).to be_a Hash
      expect(response.first[:properties]).to be_a Hash
      expect(response.first[:properties][:Name]).to eq('Conoy')
    end
  end
end
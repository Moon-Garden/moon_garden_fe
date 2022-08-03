require 'rails_helper'

RSpec.describe LandService do
  context '#get_land_data' do
    it 'returns polygon map data', :vcr do
      lat = '38.892062'
      lng = '-77.019912'
      
      response = LandService.get_land_data(lat, lng)
      expect(response).to be_an Array
      expect(response.first).to be_a Hash
      expect(response.first[:properties]).to be_a Hash
      expect(response.first[:properties][:Name]).to eq('Conoy')
    end

    it 'returns multiple names', :vcr do
      lat = '42.588079'
      lng = '-87.822877'
      
      response = LandService.get_land_data(lat, lng)
      expect(response).to be_an Array
      expect(response.first).to be_a Hash
      expect(response.first[:properties]).to be_a Hash
      expect(response.first[:properties][:Name]).to eq('Dakȟóta (Western Dakota)')
      expect(response[1][:properties][:Name]).to eq('Dakhóta (Eastern Dakota)')
      expect(response[2][:properties][:Name]).to eq('Hoocąk (Ho-Chunk)')
    end
  end
end
require 'rails_helper'

RSpec.describe 'ip service' do
  context 'get_ip_location' do
    it 'returns latitude and longitude', :vcr do
      ip = '24.164.247.195'
      response = IpService.get_ip_location(ip)
      expect(response).to be_a Hash
      expect(response[:geoplugin_latitude]).to eq('42.5293')
      expect(response[:geoplugin_longitude]).to eq('-87.8855')
    end
  end
end

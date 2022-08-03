require 'rails_helper'

RSpec.describe IpFacade do
  describe '#get_ip_location' do
    it 'creates geocoder object with lat and lng', :vcr do
      ip = '24.164.247.195'

      ll = IpFacade.get_ip_location(ip)

      expect(ll).to be_a(Geocoder)
      expect(ll.coordinates).to eq('42.5293,-87.8855')
    end
  end
end
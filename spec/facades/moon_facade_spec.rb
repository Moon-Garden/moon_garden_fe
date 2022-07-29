require 'rails_helper'

RSpec.describe MoonFacade do
    describe "#get_moon_data(data)" do
        it 'create a moon and returns moon info', :vcr do
          timestamp = Time.new.to_i

          moon = MoonFacade.get_moon_data(timestamp)

          expect(moon).to be_a(Moon)
        end
    end
end

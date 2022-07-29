require 'rails_helper'

RSpec.describe Moon do
    it "exists and has attributes", :vcr do
        data = 	{
      		"Error": 0,
      		"ErrorMsg": "success",
      		"TargetDate": "1659108392",
      		"Moon": [
      			"Thunder Moon"
      		],
      		"Index": 0,
      		"Age": 0.81897683012893363052597806017729453742504119873046875,
      		"Phase": "New Moon",
      		"Distance": 401450.369999999995343387126922607421875,
      		"Illumination": 0.01000000000000000020816681711721685132943093776702880859375,
      		"AngularDiameter": 0.496096583651577438534019393046037293970584869384765625,
      		"DistanceToSun": 151878283.30523812770843505859375,
      		"SunAngularDiameter": 0.525125431841441780989043763838708400726318359375
      	}
        moon = Moon.new(data)

        expect(moon).to be_a(Moon)
        expect(moon.phase).to eq('New Moon')
        expect(moon.name).to eq('Thunder Moon')

    end
end

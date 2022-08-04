require 'rails_helper'

RSpec.describe Land do
  it 'exists and has attributes', :vcr do
    data = {
        "type": "Feature",
        "properties": {
            "Name": "Dakȟóta (Western Dakota)",
            "FrenchName": "Dakȟóta (Western Dakota)",
            "Slug": "oceti-sakowin-sioux",
            "description": "https://native-land.ca/maps/languages/dakhota-2/",
            "FrenchDescription": "https://native-land.ca/maps/languages/dakhota-2/",
            "color": "#A61111"
        }
      }

    land = Land.new(data)

    expect(land).to be_a(Land)
    expect(land.name).to eq('Dakȟóta (Western Dakota)')
    expect(land.description).to eq('https://native-land.ca/maps/languages/dakhota-2/')
  end
end
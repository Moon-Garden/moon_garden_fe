require 'rails_helper'

RSpec.describe Plant do
    it "exists and has attributes", :vcr do
        data = 	{
            		"type": "crops",
            		"id": "543c216c3938620002020000",
            		"attributes": {
            			"name": "Thai Basil",
            			"slug": "thai-basil",
            			"binomial_name": "Ocimum basilicum",
            			"common_names": nil,
            			"description": "Fragrant and delicious herb with tender green leaves. Great in just about anything - salad, sauces, meat marinades, and even popcorn.",
            			"sun_requirements": "Full Sun",
            			"sowing_method": "Plant seeds under 1cm of soil in starting pots. Keep the plants indoors or transplant them outdoors in late spring.",
            			"spread": 30,
            			"row_spacing": 30,
            			"height": 45,
            			"processing_pictures": 0,
            			"guides_count": 10,
            			"main_image_path": "https://s3.amazonaws.com/openfarm-project/production/media/pictures/attachments/55a9cd0c36303100030a0100.jpg?1437191423",
            			"taxon": "Species",
            			"tags_array": [
            				"herb"
            			],
            			"growing_degree_days": nil
                  }
                }
        plant = Plant.new(data)

        expect(plant).to be_a(Plant)
        expect(plant.id).to eq('543c216c3938620002020000')
        expect(plant.name).to eq('Thai Basil')
        expect(plant.sun_requirements).to eq('Full Sun')
        expect(plant.description).to eq('Fragrant and delicious herb with tender green leaves. Great in just about anything - salad, sauces, meat marinades, and even popcorn.')
        expect(plant.sowing_method).to eq("Plant seeds under 1cm of soil in starting pots. Keep the plants indoors or transplant them outdoors in late spring.")
        expect(plant.spread).to eq(30)
        expect(plant.row_spacing).to eq(30)
        expect(plant.height).to eq(45)
        expect(plant.main_image_path).to eq('https://s3.amazonaws.com/openfarm-project/production/media/pictures/attachments/55a9cd0c36303100030a0100.jpg?1437191423')

    end
end

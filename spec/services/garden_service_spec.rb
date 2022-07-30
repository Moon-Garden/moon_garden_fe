require 'rails_helper'

RSpec.describe 'garden be service' do
  context 'get_garden_data' do
    it 'gives me the garden data', :vcr do
      user_hash =
        {"name"=>"Jennifer Halloran",
            "email"=>"jenniferlhalloran@gmail.com",
            "unverified_email"=>"jenniferlhalloran@gmail.com",
            "email_verified"=>true,
            "first_name"=>"Jennifer",
            "last_name"=>"Halloran",
            "image"=>"https://lh3.googleusercontent.com/a-/AFdZucr_zffBdhJaydFkdXeeHkhe2BzmVNKGIE-Ozwvh=s96-c"}


            # binding.pry
      garden_json =
        {
          "user_id": 1,
          "name": "value1",
          "notes": "value2",
          "cardinal_direction": 1
        }
      headers = { 'CONTENT_TYPE' => 'application/json' }

          user_response = UserService.find_or_create_user(user_hash)

      # timestamp = Time.new.to_i
        response = GardenService.create_garden(garden_json)
        # expect(response).to be_a Array
        # expect(response.first).to be_a Hash
        # expect(response.first[:Phase]).to be_a String
    end
  end
end

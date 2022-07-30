require 'rails_helper'

RSpec.describe GardenFacade do 
    describe "#create_garden(data)" do
        it 'returns a garden object', :vcr do 

      user_hash =
      {"name"=>"Jennifer Halloran",
          "email"=>"jenniferlhalloran@gmail.com",
          "unverified_email"=>"jenniferlhalloran@gmail.com",
          "email_verified"=>true,
          "first_name"=>"Jennifer",
          "last_name"=>"Halloran",
          "image"=>"https://lh3.googleusercontent.com/a-/AFdZucr_zffBdhJaydFkdXeeHkhe2BzmVNKGIE-Ozwvh=s96-c"}
        
          user_response = UserService.find_or_create_user(user_hash)

            garden_hash =
            {
              "user_id": "#{user_response[:data][:id]}",
              "name": "Summer Garden",
              "notes": "it's too damn hot",
              "cardinal_direction": 1
            }
    
          garden = GardenFacade.create_garden(garden_hash)  

          expect(garden).to be_a(Garden)
        end
    end
end
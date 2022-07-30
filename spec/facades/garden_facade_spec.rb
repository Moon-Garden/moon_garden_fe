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
        
          user = UserService.find_or_create_user(user_hash)

            garden_hash =
            {
              "user_id": "#{user[:data][:id]}",
              "name": "Summer Garden",
              "notes": "it's too damn hot",
              "cardinal_direction": 1
            }
    
          garden = GardenFacade.create_garden(garden_hash)  

          expect(garden).to be_a(Garden)
        end
    end

    describe '#get_garden_info(user_id)' do
      it 'returns the gardens associated with a user by id', :vcr do
        user_hash =
        {"name"=>"Jennifer Halloran",
            "email"=>"jenniferlhalloran@gmail.com",
            "unverified_email"=>"jenniferlhalloran@gmail.com",
            "email_verified"=>true,
            "first_name"=>"Jennifer",
            "last_name"=>"Halloran",
            "image"=>"https://lh3.googleusercontent.com/a-/AFdZucr_zffBdhJaydFkdXeeHkhe2BzmVNKGIE-Ozwvh=s96-c"}
          
            user = UserService.find_or_create_user(user_hash)
  
              garden_hash_1 =
              {
                "user_id": "#{user[:data][:id]}",
                "name": "Summer Garden",
                "notes": "it's too damn hot",
                "cardinal_direction": 1
              }
      
              garden_hash_2 =
              {
                "user_id": "#{user[:data][:id]}",
                "name": "Winter Garden",
                "notes": "it's too damn cold",
                "cardinal_direction": 1
              }
      
            garden1 = GardenFacade.create_garden(garden_hash_1)  
            garden2 = GardenFacade.create_garden(garden_hash_2)  

            user_gardens = GardenFacade.get_garden_info(user[:data][:id])

            expect(user_gardens).to be_all(Garden)
            # expect(user_gardens.count).to eq(2)
      end
    end
end
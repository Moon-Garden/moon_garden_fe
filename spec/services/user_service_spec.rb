require 'rails_helper'

RSpec.describe 'user service' do
    it 'creates and returns a new user' do 
        json_response = {
            "data": {
              "id": "1",
              "type": "user",
              "attributes": {
                "first_name": "Jennifer",
                "email": 'jenniferlhalloran@gmail.com',
                "image": "https://lh3.googleusercontent.com/a-/AFdZucr_zffBdhJaydFkdXeeHkhe2BzmVNKGIE-Ozwvh=s96-cﬁ",
              }
            }
        }.to_json

        user_hash = 
        {"name"=>"Jennifer Halloran",
            "email"=>"jenniferlhalloran@gmail.com",
            "unverified_email"=>"jenniferlhalloran@gmail.com",
            "email_verified"=>true,
            "first_name"=>"Jennifer",
            "last_name"=>"Halloran",
            "image"=>"https://lh3.googleusercontent.com/a-/AFdZucr_zffBdhJaydFkdXeeHkhe2BzmVNKGIE-Ozwvh=s96-c"}

            stub_request(:post, "https://moon-garden-be.herokuapp.com/api/v1/users").
            with(
              body: "{\"name\":\"Jennifer Halloran\",\"email\":\"jenniferlhalloran@gmail.com\",\"unverified_email\":\"jenniferlhalloran@gmail.com\",\"email_verified\":true,\"first_name\":\"Jennifer\",\"last_name\":\"Halloran\",\"image\":\"https://lh3.googleusercontent.com/a-/AFdZucr_zffBdhJaydFkdXeeHkhe2BzmVNKGIE-Ozwvh=s96-c\"}",
              headers: {
             'Accept'=>'*/*',
             'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
             'Content-Type'=>'application/json',
             'User-Agent'=>'Faraday v2.3.0'
              }).
            to_return(status: 200, body: json_response, headers: {})

            
            response = UserService.create_user(user_hash)
            
            expect(response).to be_a Hash
            expect(response[:data]).to be_a Hash
            expect(response[:data]).to have_key :id
            expect(response[:data][:attributes]).to have_key :first_name
            expect(response[:data][:attributes]).to have_key :email
            expect(response[:data][:attributes]).to have_key :image
        end 
end
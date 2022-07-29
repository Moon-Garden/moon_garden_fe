require 'rails_helper'

RSpec.describe 'user service' do
    it 'creates and returns a new user' do 
        user_hash = 
        {"name"=>"Jennifer Halloran",
            "email"=>"jenniferlhalloran@gmail.com",
            "unverified_email"=>"jenniferlhalloran@gmail.com",
            "email_verified"=>true,
            "first_name"=>"Jennifer",
            "last_name"=>"Halloran",
            "image"=>"https://lh3.googleusercontent.com/a-/AFdZucr_zffBdhJaydFkdXeeHkhe2BzmVNKGIE-Ozwvh=s96-c"}


            
            response = UserService.find_or_create_user(user_hash)
            
            expect(response).to be_a Hash
            expect(response[:data]).to be_a Hash
            expect(response[:data]).to have_key :id
            expect(response[:data][:attributes]).to have_key :name
            expect(response[:data][:attributes]).to have_key :email
            expect(response[:data][:attributes]).to have_key :image
        end 
end
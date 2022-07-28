require 'rails_helper'

RSpec.describe User do
    it "exists and has attributes" do
        data = {
            "id": "1",
            "type": "user",
            "attributes": {
              "first_name": "Jennifer",
              "email": 'jenniferlhalloran@gmail.com',
              "image": "https://lh3.googleusercontent.com/a-/AFdZucr_zffBdhJaydFkdXeeHkhe2BzmVNKGIE-Ozwvh=s96-cﬁ",
            }
        }
        user = User.new(data)
    
        expect(user).to be_a(User)
        expect(user.first_name).to eq("Jennifer")
        expect(user.email).to eq('jenniferlhalloran@gmail.com')
        expect(user.image).to eq("https://lh3.googleusercontent.com/a-/AFdZucr_zffBdhJaydFkdXeeHkhe2BzmVNKGIE-Ozwvh=s96-cﬁ")
    end
end
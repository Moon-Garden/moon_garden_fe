require 'rails_helper'

RSpec.describe User do
  it 'exists and has attributes', :vcr do
    data = {
      "id": '1',
      "type": 'user',
      "attributes": {
        "name": 'Jennifer Halloran',
        "email": 'frankfurters@weinermobile.com',
        "image": 'https://lh3.googleusercontent.com/a-/AFdZucr_zffBdhJaydFkdXeeHkhe2BzmVNKGIE-Ozwvh=s96-cﬁ'
      }
    }
    user = User.new(data)

    expect(user).to be_a(User)
    expect(user.id).to eq('1')
    expect(user.name).to eq('Jennifer Halloran')
    expect(user.email).to eq('frankfurters@weinermobile.com')
    expect(user.image).to eq('https://lh3.googleusercontent.com/a-/AFdZucr_zffBdhJaydFkdXeeHkhe2BzmVNKGIE-Ozwvh=s96-cﬁ')
  end
end

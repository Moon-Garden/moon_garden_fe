require 'rails_helper'

RSpec.describe UserFacade do
  describe '#create_user(data)' do
    it 'create or finds a user and returns user info', :vcr do
      user_hash = { 'name' => 'Jennifer Halloran',
                    'email' => 'jenniferlhalloran@gmail.com',
                    'unverified_email' => 'jenniferlhalloran@gmail.com',
                    'email_verified' => true,
                    'first_name' => 'Jennifer',
                    'last_name' => 'Halloran',
                    'image' => 'https://lh3.googleusercontent.com/a-/AFdZucr_zffBdhJaydFkdXeeHkhe2BzmVNKGIE-Ozwvh=s96-c' }

      user = UserFacade.find_or_create_user(user_hash)

      expect(user).to be_a(User)
    end
  end
end

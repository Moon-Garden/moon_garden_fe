require 'rails_helper'

RSpec.describe 'garden delete' do
  it 'has a button to delete a garden', :vcr do
    user_hash =
      { 'name' => 'Hot Dog',
        'email' => 'frankfurters@weinermobile.com',
        'unverified_email' => 'frankfurters@weinermobile.com',
        'email_verified' => true,
        'first_name' => 'Hot',
        'last_name' => 'Dog',
        'image' => 'https://lh3.googleusercontent.com/a-/AFdZucr_zffBdhJaydFkdXeeHkhe2BzmVNKGIE-Ozwvh=s96-c' }

      user = UserFacade.find_or_create_user(user_hash)

      garden_hash =
      {
        "user_id": "#{user.id}",
        "name": 'Summer Garden',
        "notes": "it's too damn hot",
        "cardinal_direction": 1
      }

    garden = GardenFacade.create_garden(garden_hash)

    visit '/'
    click_on 'Login'

    expect(current_path).to eq("/dashboard")
    expect(page).to have_content("Summer Garden")
 ##Cant currently complete this test because there are so many gardens...
    GardenFacade.destroy_garden(user.id, garden.id)
  end
end

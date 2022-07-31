require 'rails_helper'

RSpec.describe 'Dashboard Show Page' do
  context 'a user is logged in' do
    before :each do
      Rails.application.env_config['omniauth.auth'] = OmniAuth.config.mock_auth[:google_oauth2]
      visit '/'
      click_on 'Login'
    end

# !!! THE EXPECT STATEMENTS ARE MOCKS AND STILL NEED TO BE FILLED WITH CORRECT INFO !!!
    it 'is on the dashboard', :vcr do
      expect(current_path).to eq('/dashboard')
    end

    xit 'diplays the title of the app' do
      expect(page).to have_content("Moon Garden")
    end

    xit 'has a section title "(Users name)s Gardens" with all their gardens listed' do
      expect(page).to have_content("User's Gardens")
      expect(page).to have_content("Summer Garden")
      expect(page).to have_content("Winter Garden")
      expect(page).to_not have_content("Stupid dumbo idiot Garden")
    end

    xit 'each garden listed is a link to that gardens show page' do
      click_link("Summer Garden")
      expect(current_path).to eq("/users/#{user.id}/gardens/#{summer_garden.id}")
    end

    xit 'has a button to create a new garden' do
      click_button("New Garden")
      expect(current_path).to eq(users_gardens_new_path_or_something)
      #fill out new garden form and submit
      expect(current_path).to eq('/dashboard')
      expect(page).to have_content("new gardens name")
    end

    xit 'displays the lunar recommendations' do
      #not sure how to test for this
    end
  end

  context 'a user is not logged in', :vcr do
    it 'redirects you to the log in page ' do
      visit '/dashboard'
      expect(current_path).to eq('/')
    end
  end
end

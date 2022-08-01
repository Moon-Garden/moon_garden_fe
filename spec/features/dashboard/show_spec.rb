require 'rails_helper'

RSpec.describe 'Dashboard Show Page' do
  context 'a user is logged in' do
    it 'directs a user to their dashboard upon logging in', :vcr do
      # Rails.application.env_config['omniauth.auth'] = OmniAuth.config.mock_auth[:google_oauth2]

      visit '/'
      click_on 'Login'

      expect(current_path).to eq('/dashboard')
    end

    it "displays the users name and picture", :vcr do
      visit '/'
      click_on 'Login'

      expect(page).to have_content("Dot's Gardens")
    end
    
    it "has a section to provide lunar recommendations", :vcr do
      visit '/'
      click_on 'Login'
      within '.recommendation-container' do 
        expect(page).to have_content("Waning: Avoid planting and focus on fertilizing the soil. This is the best time to mow grass, harvest, transplant and prune.")
      end 
    end

    it "displays each user garden with garden info and a link to the garden's show page" do
      
    end
  end
end

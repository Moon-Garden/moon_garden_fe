require 'rails_helper'

RSpec.describe 'Dashboard Show Page' do
    context "a user is logged in" do
        it "gives me the gardens of the user", :vcr do
            Rails.application.env_config['omniauth.auth'] = OmniAuth.config.mock_auth[:google_oauth2]

            visit '/'
            click_on 'Login'

            expect(current_path).to eq('/dashboard')

            expect(page).to have_content("Gardens:")

            save_and_open_page
        end
    end
end

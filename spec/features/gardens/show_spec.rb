require 'rails_helper'

RSpec.describe 'garden show page' do 
  xit 'displays the plants belonging to a garden' do 
    visit '/'
    click_on 'Login'
    expect(current)
  end
end
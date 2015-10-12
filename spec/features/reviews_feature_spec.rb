require 'rails_helper'

feature 'reviewing' do
  before {Restaurant.create name: 'Chipotle'}

  scenario 'allows users to leave a review using a form' do
    visit '/restaurants'
    click_link 'Review Chipotle'
    fill_in "Thoughts", with: "Best damn chickent this side of Kentucky?"
    select '5', from: 'Rating'
    click_button 'Leave review'

    expect(current_path).to eq '/restaurants'
    expect(page).to have_content('Best damn chickent this side of Kentucky?')
  end
end

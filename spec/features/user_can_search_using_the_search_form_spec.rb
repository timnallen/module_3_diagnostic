require 'rails_helper'

feature 'User can search' do
  scenario 'and view query results' do
    visit '/'

    fill_in 'q', with: 80206

    click_on 'Locate'

    expect(current_path).to eq('/search')

    expect(page).to have_css('#results')
    # Then I should see a list of the 15 closest stations within 5 miles sorted by distance Not sure this is covered yet
    expect(page).to have_css('.result', count: 15)

    within(first('.result')) do
      expect(page).to have_css('.name')
      expect(page).to have_css('.address')
      expect(page).to have_content('Fuel Types: Electric' || 'Fuel Types: Propane')
      expect(page).to have_css('.distance')
      expect(page).to have_css('.access-times')
    end
    # And the stations should be limited to Electric and Propane Not sure if this is covered yet...
    expect(page).to_not have_content('private')
    expect(page).to_not have_content('planned')
    expect(page).to_not have_content('temporarily unavailable')
    expect(page).to have_content('Total Results: ')
  end
end

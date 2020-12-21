require 'rails_helper'

RSpec.feature "Position search", type: :feature do
  before do
    sign_in FactoryBot.create(:user, :admin)
    @positions = FactoryBot.create_list(:position, 30)
    visit admin_path
    click_link "positions-tab"
  end

  scenario 'Reduce the table with a position_name search', js: true do
    fill_in 'query_position', with: @positions.first.position_name
    find('button[data-model="position"][data-target="search.button"]').click
    sleep 1
    within('#positions-table') do
      expect(all('tr').count).to be < 30
    end
  end

  scenario 'find the good result with a position_name search', js: true do
    fill_in 'query_position', with: @positions.first.position_name
    find('button[data-model="position"][data-target="search.button"]').click
    sleep 1
    expect(page).to have_content(@positions.first.position_name)
  end

  scenario 'Reduce the table with position_name first letters search', js: true do
    fill_in 'query_position', with: @positions.first.position_name[0, 3]
    find('button[data-model="position"][data-target="search.button"]').click
    sleep 1
    within('#positions-table') do
      expect(all('tr').count).to be < 30
    end
  end

  scenario 'find the good result with position_name first letters search', js: true do
    fill_in 'query_position', with: @positions.first.position_name[0, 3]
    find('button[data-model="position"][data-target="search.button"]').click
    sleep 1
    expect(page).to have_content(@positions.first.position_name)
  end

  scenario 'Invalid search', js: true do
    fill_in 'query_position', with: '@@@'
    find('button[data-model="position"][data-target="search.button"]').click
    sleep 1
    within('#positions-table') do
      expect(all('tr').count).to eq(1)
    end
  end
end

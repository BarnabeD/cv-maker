require 'rails_helper'

RSpec.feature "Site search", type: :feature do
  before do
    sign_in FactoryBot.create(:user, :admin)
    @sites = FactoryBot.create_list(:site, 30)
    visit admin_path
    click_link "sites-tab"
  end

  scenario 'Click "flag" to toggle from confident to not sure', js: true do
    find("tr[data-id=\"#{@sites.first.id}\"]").click
    sleep 0.5
    click_link "sites-tab"
    expect(find("tr[data-id=\"#{@sites.first.id}\"]").assert_selector('.table-warning'))
  end

  # scenario 'find the good result with a name search', js: true do
  #   fill_in 'query_site', with: @sites.first.name
  #   find('button[data-model="site"][data-target="search.button"]').click
  #   sleep 1
  #   expect(page).to have_content(@sites.first.name)
  # end

  # scenario 'Reduce the table with name first letters search', js: true do
  #   fill_in 'query_site', with: @sites.first.name[0, 3]
  #   find('button[data-model="site"][data-target="search.button"]').click
  #   sleep 1
  #   within('#sites-table') do
  #     expect(all('tr').count).to be < 30
  #   end
  # end

  # scenario 'find the good result with name first letters search', js: true do
  #   fill_in 'query_site', with: @sites.first.name[0, 3]
  #   find('button[data-model="site"][data-target="search.button"]').click
  #   sleep 1
  #   expect(page).to have_content(@sites.first.name)
  # end

  # scenario 'Invalid search', js: true do
  #   fill_in 'query_site', with: '@@@'
  #   find('button[data-model="site"][data-target="search.button"]').click
  #   sleep 1
  #   within('#sites-table') do
  #     expect(all('tr').count).to eq(1)
  #   end
  # end
end

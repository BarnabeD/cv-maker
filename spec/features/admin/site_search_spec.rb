require 'rails_helper'

RSpec.feature "Site search", type: :feature do
  before do
    sign_in FactoryBot.create(:user, :admin)
    @sites = FactoryBot.create_list(:site, 30)
    visit admin_path
    click_link "sites-tab"
  end

  scenario 'Reduce the table with a name search' do
    fill_in 'query_site', with: @sites.first.name
    find('button[data-model="site"][data-target="search.button"]').click
    within('#sites-table>tbody') do
      expect(all('tr').count).to be < 30
    end
  end

  scenario 'find the good result with a name search' do
    fill_in 'query_site', with: @sites.first.name
    find('button[data-model="site"][data-target="search.button"]').click
    expect(page).to have_content(@sites.first.name)
  end

  scenario 'Reduce the table with name first letters search' do
    fill_in 'query_site', with: @sites.first.name[0, 3]
    find('button[data-model="site"][data-target="search.button"]').click
    within('#sites-table>tbody') do
      expect(all('tr').count).to be < 30
    end
  end

  scenario 'find the good result with name first letters search' do
    fill_in 'query_site', with: @sites.first.name[0, 3]
    find('button[data-model="site"][data-target="search.button"]').click
    expect(page).to have_content(@sites.first.name)
  end

  scenario 'Invalid search' do
    fill_in 'query_site', with: '@@@'
    find('button[data-model="site"][data-target="search.button"]').click
    within('#sites-table>tbody') do
      expect(all('tr').count).to eq(0)
    end
  end
end

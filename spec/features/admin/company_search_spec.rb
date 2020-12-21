require 'rails_helper'

RSpec.feature "Company search", type: :feature do
  before do
    sign_in FactoryBot.create(:user, :admin)
    @companies = FactoryBot.create_list(:company, 30)
    visit admin_path
    click_link "companies-tab"
  end

  scenario 'Reduce the table with a name search', js: true do
    fill_in 'query_company', with: @companies.first.name
    find('button[data-model="company"][data-target="search.button"]').click
    sleep 1
    within('#companies-table') do
      expect(all('tr').count).to be < 30
    end
  end

  scenario 'find the good result with a name search', js: true do
    fill_in 'query_company', with: @companies.first.name
    find('button[data-model="company"][data-target="search.button"]').click
    sleep 1
    expect(page).to have_content(@companies.first.name)
  end

  scenario 'Reduce the table with name first letters search', js: true do
    fill_in 'query_company', with: @companies.first.name[0, 3]
    find('button[data-model="company"][data-target="search.button"]').click
    sleep 1
    within('#companies-table') do
      expect(all('tr').count).to be < 30
    end
  end

  scenario 'find the good result with name first letters search', js: true do
    fill_in 'query_company', with: @companies.first.name[0, 3]
    find('button[data-model="company"][data-target="search.button"]').click
    sleep 1
    expect(page).to have_content(@companies.first.name)
  end

  scenario 'Invalid search', js: true do
    fill_in 'query_company', with: '@@@'
    find('button[data-model="company"][data-target="search.button"]').click
    sleep 1
    within('#companies-table') do
      expect(all('tr').count).to eq(1)
    end
  end
end

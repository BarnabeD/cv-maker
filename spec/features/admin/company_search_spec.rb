require 'rails_helper'

RSpec.feature "Company search", type: :feature do
  before do
    sign_in FactoryBot.create(:user, :admin)
    @companies = FactoryBot.create_list(:company, 30)
    visit admin_path
    click_link "companies-tab"
  end

  scenario 'Reduce the table with a name search' do
    fill_in 'query_company', with: @companies.first.name
    find('button[data-model="company"][data-target="search.button"]').click
    within('#companies-table>tbody') do
      expect(all('tr').count).to be < 30
    end
  end

  scenario 'find the good result with a name search' do
    fill_in 'query_company', with: @companies.first.name
    find('button[data-model="company"][data-target="search.button"]').click
    expect(page).to have_content(@companies.first.name)
  end

  scenario 'Reduce the table with name first letters search' do
    fill_in 'query_company', with: @companies.first.name[0, 3]
    find('button[data-model="company"][data-target="search.button"]').click
    within('#companies-table>tbody') do
      expect(all('tr').count).to be < 30
    end
  end

  scenario 'find the good result with name first letters search' do
    fill_in 'query_company', with: @companies.first.name[0, 3]
    find('button[data-model="company"][data-target="search.button"]').click
    expect(page).to have_content(@companies.first.name)
  end

  scenario 'Invalid search' do
    fill_in 'query_company', with: '@@@'
    find('button[data-model="company"][data-target="search.button"]').click
    within('#companies-table>tbody') do
      expect(all('tr').count).to eq(0)
    end
  end
end

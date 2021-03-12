require 'rails_helper'

RSpec.feature "Worker search", type: :feature do
  before do
    sign_in FactoryBot.create(:user, :admin)
    @workers = FactoryBot.create_list(:worker, 30, :skip_validate)
    visit admin_path
    click_link "workers-tab"
  end

  scenario 'Reduce the table with a last_name search' do
    fill_in 'query_worker', with: @workers.first.last_name
    find('button[data-model="worker"][data-target="search.button"]').click
    within('#workers-table>tbody') do
      expect(all('tr').count).to be < 30
    end
  end

  scenario 'find the good result with a last_name search' do
    fill_in 'query_worker', with: @workers.first.last_name
    find('button[data-model="worker"][data-target="search.button"]').click
    expect(page).to have_content(@workers.first.last_name)
  end

  scenario 'Reduce the table with a first_name search' do
    fill_in 'query_worker', with: @workers.first.first_name
    find('button[data-model="worker"][data-target="search.button"]').click
    within('#workers-table>tbody') do
      expect(all('tr').count).to be < 30
    end
  end

  scenario 'find the good result with a first_name search' do
    fill_in 'query_worker', with: @workers.first.first_name
    find('button[data-model="worker"][data-target="search.button"]').click
    expect(page).to have_content(@workers.first.first_name)
  end


  scenario 'Reduce the table with first_name first letters search' do
    fill_in 'query_worker', with: @workers.first.first_name[0, 3]
    find('button[data-model="worker"][data-target="search.button"]').click
    within('#workers-table>tbody') do
      expect(all('tr').count).to be < 30
    end
  end

  scenario 'find the good result with a first_name first letters search' do
    fill_in 'query_worker', with: @workers.first.first_name[0, 3]
    find('button[data-model="worker"][data-target="search.button"]').click
    expect(page).to have_content(@workers.first.first_name)
  end

  scenario 'Invalid search' do
    fill_in 'query_worker', with: '@@@'
    find('button[data-model="worker"][data-target="search.button"]').click
    within('#workers-table>tbody') do
      expect(all('tr').count).to eq(0)
    end
  end
end

require 'rails_helper'

RSpec.describe 'Creating a Company', type: :feature do
  before do
    sign_in FactoryBot.create(:user, :admin)
    @company = FactoryBot.build(:company)
    visit new_company_path
    fill_in 'company_name', with: @company.name
    fill_in 'company_city', with: @company.city
  end

  scenario 'valid inputs' do
    click_on "Créer un(e) Company"
    expect(page).to have_content(@company.name)
  end

  scenario 'missing name' do
    fill_in 'company_name', with: nil
    click_on "Créer un(e) Company"
    expect(page).to have_content("Name doit être rempli(e)")
  end

  scenario 'missing city' do
    fill_in 'company_city', with: nil
    click_on "Créer un(e) Company"
    expect(page).to have_content("City doit être rempli(e)")
  end
end

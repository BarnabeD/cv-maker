require 'rails_helper'

RSpec.feature "Update a Company", type: :feature do
before do
    sign_in FactoryBot.create(:user)
    @old_company = FactoryBot.create(:company)
    @new_company = FactoryBot.build(:company)
    visit edit_company_path(@old_company)

    fill_in 'company_name', with: @new_company.name
    fill_in 'company_city', with: @new_company.city
  end

  scenario 'valid inputs' do
    click_on "Modifier ce(tte) Company"
    expect(page).to have_content(@new_company.name)
  end

  scenario 'missing name', js: true do
    fill_in 'company_name', with: nil
    sleep 2
    click_on "Modifier ce(tte) Company"
    expect(page).to have_content("Name doit être rempli(e)")
  end
end

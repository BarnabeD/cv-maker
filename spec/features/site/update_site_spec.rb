require 'rails_helper'

RSpec.feature "Update a site", type: :feature do
before do
    sign_in FactoryBot.create(:user)
    clients = FactoryBot.create_list(:client, 10)
    @old_site = FactoryBot.create(:site)
    @new_site = FactoryBot.build(:site, client: clients.last)
    visit edit_site_path(@old_site)

    select(@new_site.client.name, from: 'site_client_id')
    fill_in 'site_name', with: @new_site.name
    select(@new_site.site_type, from: 'site_site_type')
    select(@new_site.start_date.day, from: 'site_start_date_3i')
    select(FRENCH_MONTH[@new_site.start_date.month.to_s], from: 'site_start_date_2i')
    select(@new_site.start_date.year, from: 'site_start_date_1i')
    select(@new_site.end_date.day, from: 'site_end_date_3i')
    select(FRENCH_MONTH[@new_site.end_date.month.to_s], from: 'site_end_date_2i')
    select(@new_site.end_date.year, from: 'site_end_date_1i')
    fill_in 'site_amount', with: @new_site.amount
    select(@new_site.money_unit, from: 'site_money_unit')
  end

  scenario 'valid inputs' do
    click_on "Modifier ce(tte) Chantier"
    expect(page).to have_content(@new_site.name)
  end

  scenario 'missing name' do
    fill_in 'site_name', with: nil
    click_on "Modifier ce(tte) Chantier"
    expect(page).to have_content("Name doit être rempli(e)")
  end
end

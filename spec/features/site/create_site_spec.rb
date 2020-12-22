require 'rails_helper'

RSpec.describe 'Creating a Site', type: :feature do
  before do
    sign_in FactoryBot.create(:user, :admin)
    clients = FactoryBot.create_list(:client, 10)
    @site = FactoryBot.build(:site, client: clients.last)
    visit new_site_path
    select(@site.client.name, from: 'site_client_id')
    fill_in 'site_name', with: @site.name
    select(@site.site_type, from: 'site_site_type')
    select(@site.start_date.day, from: 'site_start_date_3i')
    select(FRENCH_MONTH[@site.start_date.month.to_s], from: 'site_start_date_2i')
    select(@site.start_date.year, from: 'site_start_date_1i')
    select(@site.end_date.day, from: 'site_end_date_3i')
    select(FRENCH_MONTH[@site.end_date.month.to_s], from: 'site_end_date_2i')
    select(@site.end_date.year, from: 'site_end_date_1i')
    fill_in 'site_amount', with: @site.amount
    select(@site.money_unit, from: 'site_money_unit')
  end

  scenario 'valid inputs' do
    click_on "Créer un(e) Chantier"
    expect(page).to have_content(@site.name)
  end

  scenario 'missing name' do
    fill_in 'site_name', with: nil
    click_on "Créer un(e) Chantier"
    expect(page).to have_content("Name doit être rempli(e)")
  end

  scenario 'missing amount' do
    fill_in 'site_amount', with: nil
    click_on "Créer un(e) Chantier"
    expect(page).to have_content("Amount doit être rempli(e)")
  end
end

FRENCH_MONTH = {
  '1' => 'janvier',
  '2' => 'février',
  '3' => 'mars',
  '4' => 'avril',
  '5' => 'mai',
  '6' => 'juin',
  '7' => 'juillet',
  '8' => 'août',
  '9' => 'septembre',
  '10' => 'octobre',
  '11' => 'novembre',
  '12' => 'décembre'
}

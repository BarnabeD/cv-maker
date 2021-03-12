require 'rails_helper'

RSpec.describe 'Creating a Position', type: :feature do
  before do
    sign_in FactoryBot.create(:user)
    @position = FactoryBot.build(:position)
    @position.worker.save
    @position.company.save

    visit worker_path(@position.worker)
    click_on "Ajouter un chantier"
    fill_in 'position_position_name', with: @position.position_name
    select(@position.company.name, from: 'position_company_attributes_id')
    fill_in 'position_site_attributes_name', with: @position.site.name
    select(@position.site.site_type, from: 'position_site_attributes_site_type')

    select(@position.site.start_date.day, from: 'position_site_attributes_start_date_3i')
    select(FRENCH_MONTH[@position.site.start_date.month.to_s], from: 'position_site_attributes_start_date_2i')
    select(@position.site.start_date.year, from: 'position_site_attributes_start_date_1i')
    select(@position.site.end_date.day, from: 'position_site_attributes_end_date_3i')
    select(FRENCH_MONTH[@position.site.end_date.month.to_s], from: 'position_site_attributes_end_date_2i')
    select(@position.site.end_date.year, from: 'position_site_attributes_end_date_1i')
    fill_in 'position_site_attributes_amount', with: @position.site.amount
    select(@position.site.money_unit, from: 'position_site_attributes_money_unit')
    fill_in 'position_clients_name', with: @position.site.client.name
  end

  scenario 'valid inputs' do
    click_on "Créer un(e) Poste"
    expect(page).to have_content(@position.site.name)
  end

  scenario 'missing position name' do
    fill_in 'position_position_name', with: nil
    click_on "Créer un(e) Poste"
    expect(page).to have_content("Position name doit être rempli(e)")
  end

  scenario 'missing site name' do
    fill_in 'position_site_attributes_name', with: nil
    click_on "Créer un(e) Poste"
    expect(page).to have_content("Name doit être rempli(e)")
  end

  scenario 'missing amount' do
    fill_in 'position_site_attributes_amount', with: nil
    click_on "Créer un(e) Poste"
    expect(page).to have_content("Amount doit être rempli(e)")
  end

  scenario "Invert stard / end date" do
    select(@position.site.end_date.day, from: 'position_site_attributes_start_date_3i')
    select(FRENCH_MONTH[@position.site.end_date.month.to_s], from: 'position_site_attributes_start_date_2i')
    select(@position.site.end_date.year, from: 'position_site_attributes_start_date_1i')
    select(@position.site.start_date.day, from: 'position_site_attributes_end_date_3i')
    select(FRENCH_MONTH[@position.site.start_date.month.to_s], from: 'position_site_attributes_end_date_2i')
    select(@position.site.start_date.year, from: 'position_site_attributes_end_date_1i')
    click_on "Créer un(e) Poste"
    expect(page).to have_content("Start date can't be in the future")
  end
end

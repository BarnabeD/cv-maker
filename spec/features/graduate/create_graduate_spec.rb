require 'rails_helper'

RSpec.describe 'Creating a Graduate', type: :feature do
  before do
    sign_in FactoryBot.create(:user)
    @graduate = FactoryBot.build(:graduate)
    @graduate.worker.save
    visit worker_path(@graduate.worker)

    click_on "Ajouter un diplôme"
    fill_in 'graduate_name', with: @graduate.name
    fill_in 'graduate_speciality', with: @graduate.speciality
    fill_in 'graduate_school_name', with: @graduate.school_name
    select(@graduate.school_department, from: 'graduate_school_department')
    select(@graduate.graduation_date.day, from: 'graduate_graduation_date_3i')
    select(FRENCH_MONTH[@graduate.graduation_date.month.to_s], from: 'graduate_graduation_date_2i')
    select(@graduate.graduation_date.year, from: 'graduate_graduation_date_1i')
  end

  scenario 'valid inputs' do
    click_on 'Créer un(e) Diplôme'
    expect(page).to have_content(@graduate.name)
  end

  scenario 'missing name' do
    fill_in 'graduate_name', with: nil
    click_on 'Créer un(e) Diplôme'
    expect(page).to have_content("Name doit être rempli(e)")
  end

  scenario 'missing speciality' do
    fill_in 'graduate_speciality', with: nil
    click_on 'Créer un(e) Diplôme'
    expect(page).to have_content("Speciality doit être rempli(e)")
  end

  scenario 'missing school name' do
    fill_in 'graduate_school_name', with: nil
    click_on 'Créer un(e) Diplôme'
    expect(page).to have_content("School name doit être rempli(e)")
  end

  scenario 'missing school department' do
    select('', from: 'graduate_school_department')
    click_on 'Créer un(e) Diplôme'
    expect(page).to have_content("School department doit être rempli(e)")
  end
end

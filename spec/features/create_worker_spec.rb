require 'rails_helper'

RSpec.describe 'Creating a worker', type: :feature do
  before do
    sign_in FactoryBot.create(:user)
    @worker = FactoryBot.create(:worker, :skip_validate)
  end

  scenario 'valid inputs' do
    visit new_worker_path

    fill_in 'worker_first_name', with: @worker.first_name
    fill_in 'worker_last_name', with: @worker.last_name

    select(@worker.birth_date.day, from: 'worker_birth_date_3i')
    select(FRENCH_MONTH[@worker.birth_date.month.to_s], from: 'worker_birth_date_2i')
    select(@worker.birth_date.year, from: 'worker_birth_date_1i')

    select(@worker.hire_date.day, from: 'worker_hire_date_3i')
    select(FRENCH_MONTH[@worker.hire_date.month.to_s], from: 'worker_hire_date_2i')
    select(@worker.hire_date.year, from: 'worker_hire_date_1i')
    attach_file('worker_photo', Rails.root.join('spec', 'support', 'assets', 'test-image.png'))
    fill_in 'worker_matricule', with: 4
    click_on "Créer un(e) Salarié"
    expect(page).to have_content("#{@worker.first_name} #{@worker.last_name}")
  end

  scenario 'missing first_name' do
    visit new_worker_path
    fill_in 'worker_first_name', with: nil
    fill_in 'worker_last_name', with: @worker.last_name
    select(@worker.birth_date.day, from: 'worker_birth_date_3i')
    select(FRENCH_MONTH[@worker.birth_date.month.to_s], from: 'worker_birth_date_2i')
    select(@worker.birth_date.year, from: 'worker_birth_date_1i')
    select(@worker.hire_date.day, from: 'worker_hire_date_3i')
    select(FRENCH_MONTH[@worker.hire_date.month.to_s], from: 'worker_hire_date_2i')
    select(@worker.hire_date.year, from: 'worker_hire_date_1i')
    attach_file('worker_photo', Rails.root.join('spec', 'support', 'assets', 'test-image.png'))
    fill_in 'worker_matricule', with: 4
    click_on "Créer un(e) Salarié"

    expect(page).to_not have_content("#{@worker.first_name} #{@worker.last_name}")
  end

  scenario 'missing last_name' do
    visit new_worker_path
    fill_in 'worker_first_name', with: @worker.first_name
    fill_in 'worker_last_name', with: nil
    select(@worker.birth_date.day, from: 'worker_birth_date_3i')
    select(FRENCH_MONTH[@worker.birth_date.month.to_s], from: 'worker_birth_date_2i')
    select(@worker.birth_date.year, from: 'worker_birth_date_1i')
    select(@worker.hire_date.day, from: 'worker_hire_date_3i')
    select(FRENCH_MONTH[@worker.hire_date.month.to_s], from: 'worker_hire_date_2i')
    select(@worker.hire_date.year, from: 'worker_hire_date_1i')
    attach_file('worker_photo', Rails.root.join('spec', 'support', 'assets', 'test-image.png'))
    fill_in 'worker_matricule', with: 4
    click_on "Créer un(e) Salarié"

    expect(page).to_not have_content("#{@worker.first_name} #{@worker.last_name}")
  end

  scenario 'minor worker' do
    worker_minor = build(:worker, :is_minor)
    visit new_worker_path
    fill_in 'worker_first_name', with: worker_minor.first_name
    fill_in 'worker_last_name', with: @worker.last_name
    select(worker_minor.birth_date.day, from: 'worker_birth_date_3i')
    select(FRENCH_MONTH[worker_minor.birth_date.month.to_s], from: 'worker_birth_date_2i')
    select(worker_minor.birth_date.year, from: 'worker_birth_date_1i')
    select(worker_minor.hire_date.day, from: 'worker_hire_date_3i')
    select(FRENCH_MONTH[worker_minor.hire_date.month.to_s], from: 'worker_hire_date_2i')
    select(worker_minor.hire_date.year, from: 'worker_hire_date_1i')
    attach_file('worker_photo', Rails.root.join('spec', 'support', 'assets', 'test-image.png'))
    fill_in 'worker_matricule', with: 4
    click_on "Créer un(e) Salarié"

    expect(page).to_not have_content("#{worker_minor.first_name} #{worker_minor.last_name}")
  end

  scenario 'maricule is already taken' do

    visit new_worker_path
    fill_in 'worker_first_name', with: @worker.first_name
    fill_in 'worker_last_name', with: nil
    select(@worker.birth_date.day, from: 'worker_birth_date_3i')
    select(FRENCH_MONTH[@worker.birth_date.month.to_s], from: 'worker_birth_date_2i')
    select(@worker.birth_date.year, from: 'worker_birth_date_1i')
    select(@worker.hire_date.day, from: 'worker_hire_date_3i')
    select(FRENCH_MONTH[@worker.hire_date.month.to_s], from: 'worker_hire_date_2i')
    select(@worker.hire_date.year, from: 'worker_hire_date_1i')
    attach_file('worker_photo', Rails.root.join('spec', 'support', 'assets', 'test-image.png'))
    fill_in 'worker_matricule', with: 55
    click_on "Créer un(e) Salarié"

    another_worker = build(:worker)
    visit new_worker_path
    fill_in 'worker_first_name', with: another_worker.first_name
    fill_in 'worker_last_name', with: nil
    select(another_worker.birth_date.day, from: 'worker_birth_date_3i')
    select(FRENCH_MONTH[another_worker.birth_date.month.to_s], from: 'worker_birth_date_2i')
    select(another_worker.birth_date.year, from: 'worker_birth_date_1i')
    select(another_worker.hire_date.day, from: 'worker_hire_date_3i')
    select(FRENCH_MONTH[another_worker.hire_date.month.to_s], from: 'worker_hire_date_2i')
    select(another_worker.hire_date.year, from: 'worker_hire_date_1i')
    attach_file('worker_photo', Rails.root.join('spec', 'support', 'assets', 'test-image.png'))
    fill_in 'worker_matricule', with: 5
    click_on "Créer un(e) Salarié"

    expect(page).to have_content("#{another_worker.first_name} #{another_worker.last_name}")
  end

  scenario 'first_name & last_name is already taken' do
    worker_already_in_db = build(:worker)
    visit new_worker_path
    fill_in 'worker_first_name', with: worker_already_in_db.first_name
    fill_in 'worker_last_name', with: nil
    select(worker_already_in_db.birth_date.day, from: 'worker_birth_date_3i')
    select(FRENCH_MONTH[worker_already_in_db.birth_date.month.to_s], from: 'worker_birth_date_2i')
    select(worker_already_in_db.birth_date.year, from: 'worker_birth_date_1i')
    select(worker_already_in_db.hire_date.day, from: 'worker_hire_date_3i')
    select(FRENCH_MONTH[worker_already_in_db.hire_date.month.to_s], from: 'worker_hire_date_2i')
    select(worker_already_in_db.hire_date.year, from: 'worker_hire_date_1i')
    attach_file('worker_photo', Rails.root.join('spec', 'support', 'assets', 'test-image.png'))
    fill_in 'worker_matricule', with: 4
    click_on "Créer un(e) Salarié"

    expect(page).to_not have_content("#{worker_already_in_db.first_name} #{worker_already_in_db.last_name}")
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

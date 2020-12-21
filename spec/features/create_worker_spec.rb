require 'rails_helper'

RSpec.describe 'Creating a worker', type: :feature do
  before do
    sign_in FactoryBot.create(:user)
    @worker = FactoryBot.build(:worker, :skip_validate)
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
  end

  scenario 'valid inputs' do
    click_on "Créer un(e) Salarié"
    expect(page).to have_content("#{@worker.first_name} #{@worker.last_name}")
  end

  scenario 'missing first_name' do
    fill_in 'worker_first_name', with: nil
    click_on "Créer un(e) Salarié"
    expect(page).to have_content("First name doit être rempli(e)")
  end

  scenario 'missing last_name' do
    visit new_worker_path
    fill_in 'worker_last_name', with: nil
    click_on "Créer un(e) Salarié"
    expect(page).to have_content("Last name doit être rempli(e)")
  end

  scenario 'minor worker' do
    worker_minor = build(:worker, :minor)
    select(worker_minor.birth_date.day, from: 'worker_birth_date_3i')
    select(FRENCH_MONTH[worker_minor.birth_date.month.to_s], from: 'worker_birth_date_2i')
    select(worker_minor.birth_date.year, from: 'worker_birth_date_1i')
    click_on "Créer un(e) Salarié"
    expect(page).to have_content("can't be a minor worker")
  end

  scenario 'maricule is already taken' do
    click_on "Créer un(e) Salarié"

    another_worker = build(:worker)
    visit new_worker_path
    fill_in 'worker_first_name', with: another_worker.first_name
    fill_in 'worker_last_name', with: another_worker.last_name
    select(another_worker.birth_date.day, from: 'worker_birth_date_3i')
    select(FRENCH_MONTH[another_worker.birth_date.month.to_s], from: 'worker_birth_date_2i')
    select(another_worker.birth_date.year, from: 'worker_birth_date_1i')
    select(another_worker.hire_date.day, from: 'worker_hire_date_3i')
    select(FRENCH_MONTH[another_worker.hire_date.month.to_s], from: 'worker_hire_date_2i')
    select(another_worker.hire_date.year, from: 'worker_hire_date_1i')
    attach_file('worker_photo', Rails.root.join('spec', 'support', 'assets', 'test-image.png'))
    fill_in 'worker_matricule', with: 4
    click_on "Créer un(e) Salarié"
    expect(page).to have_content("Matricule n'est pas disponible")
  end

  scenario 'first_name & last_name is already taken' do
    click_on "Créer un(e) Salarié"
    worker_already_in_db = @worker
    visit new_worker_path
    fill_in 'worker_first_name', with: worker_already_in_db.first_name
    fill_in 'worker_last_name', with: worker_already_in_db.last_name
    select(worker_already_in_db.birth_date.day, from: 'worker_birth_date_3i')
    select(FRENCH_MONTH[worker_already_in_db.birth_date.month.to_s], from: 'worker_birth_date_2i')
    select(worker_already_in_db.birth_date.year, from: 'worker_birth_date_1i')
    select(worker_already_in_db.hire_date.day, from: 'worker_hire_date_3i')
    select(FRENCH_MONTH[worker_already_in_db.hire_date.month.to_s], from: 'worker_hire_date_2i')
    select(worker_already_in_db.hire_date.year, from: 'worker_hire_date_1i')
    attach_file('worker_photo', Rails.root.join('spec', 'support', 'assets', 'test-image.png'))
    fill_in 'worker_matricule', with: 88
    click_on "Créer un(e) Salarié"

    expect(page).to have_content("Worker is already in the DB")
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

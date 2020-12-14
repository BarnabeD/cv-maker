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
    # expect(page).to have_current_path(worker_path(@worker))
    expect(page).to have_content("#{@worker.first_name} #{@worker_last_name}")
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

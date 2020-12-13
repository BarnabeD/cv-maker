require 'rails_helper'

RSpec.describe 'Creating a worker', type: :feature do
  before do
    sign_in FactoryBot.create(:user)
    @worker = FactoryBot.create(:worker)
  end

  scenario 'valid inputs' do
    visit new_worker_path
    fill_in 'worker_first_name', with: @worker.first_name
    fill_in 'worker_last_name', with: @worker.last_name
    select(@worker.birth_date, from: 'worker_birth_date')
    # fill_in 'worker_birth_date', with: @worker.birth_date
    # fill_in 'worker_hire_date', with: @worker.hire_date
    attach_file('worker_photo', 'app/assets/images/worker_placeholder.png')
    fill_in 'worker_matricule', with: @worker.matricule

    click_on "Créer un(e) Salarié"
    expect(page).to have_current_path(new_worker_path)
    # expect(page).to have_content('Worker was successfully created.')
  end
end

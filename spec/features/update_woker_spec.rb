require 'rails_helper'

RSpec.feature "Update a wokers", type: :feature do
before do
    sign_in FactoryBot.create(:user)
    @worker = FactoryBot.create(:worker, :skip_validate)
    visit edit_worker_path(@worker)

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
    click_on "Modifier ce(tte) Salarié"
    expect(page).to have_content(@worker.first_name)
  end
end

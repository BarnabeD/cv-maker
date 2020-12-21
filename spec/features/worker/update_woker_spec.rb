require 'rails_helper'

RSpec.feature "Update a woker", type: :feature do
before do
    sign_in FactoryBot.create(:user)
    @old_worker = FactoryBot.create(:worker, :skip_validate)
    @new_worker = FactoryBot.build(:worker, :skip_validate)
    visit edit_worker_path(@old_worker)

    fill_in 'worker_first_name', with: @new_worker.first_name
    fill_in 'worker_last_name', with: @new_worker.last_name

    select(@new_worker.birth_date.day, from: 'worker_birth_date_3i')
    select(FRENCH_MONTH[@new_worker.birth_date.month.to_s], from: 'worker_birth_date_2i')
    select(@new_worker.birth_date.year, from: 'worker_birth_date_1i')
    select(@new_worker.hire_date.day, from: 'worker_hire_date_3i')
    select(FRENCH_MONTH[@new_worker.hire_date.month.to_s], from: 'worker_hire_date_2i')
    select(@new_worker.hire_date.year, from: 'worker_hire_date_1i')
    attach_file('worker_photo', Rails.root.join('spec', 'support', 'assets', 'test-image.png'))
    fill_in 'worker_matricule', with: 4
  end

  scenario 'valid inputs' do
    click_on "Modifier ce(tte) Salarié"
    expect(page).to have_content(@new_worker.first_name)
  end
end

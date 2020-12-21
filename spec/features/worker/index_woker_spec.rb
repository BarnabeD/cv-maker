require 'rails_helper'

RSpec.feature "List all wokers", type: :feature do
  before do
    sign_in FactoryBot.create(:user, :admin)
    @worker = FactoryBot.create(:worker, :skip_validate)
  end

  scenario 'Display all the worker' do
    visit workers_path
    expect(page).to have_content("#{@worker.first_name} #{@worker.last_name.upcase}")
  end
end

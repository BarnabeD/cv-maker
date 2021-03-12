require 'rails_helper'

RSpec.feature "Update a position", type: :feature do
before do
    sign_in FactoryBot.create(:user, :admin)
    clients = FactoryBot.create_list(:client, 10)
    @old_position = FactoryBot.create(:position)
    @new_position = FactoryBot.build(:position)
    visit edit_position_path(@old_position)

    fill_in 'position_position_name', with: @new_position.position_name
  end

  scenario 'valid inputs', js: true do
    click_on "Modifier ce(tte) Poste"
    click_link "positions-tab"
    expect(page).to have_content(@new_position.position_name)
  end

  scenario 'missing name' do
    fill_in 'position_position_name', with: nil
    click_on "Modifier ce(tte) Poste"
    expect(page).to have_content("Position name doit être rempli(e)")
  end
end

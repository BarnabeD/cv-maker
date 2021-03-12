require 'rails_helper'

RSpec.feature "Delete a Position", type: :feature do
  before do
    sign_in FactoryBot.create(:user, :admin)
    @position = FactoryBot.create(:position)
    @created_position_count = Position.count
  end

  scenario 'confirm destroy', js: true do
    visit admin_path
    click_link "positions-tab"
    tr = find("tr[data-id=\"#{@position.id}\"]")
    tr.click_link(class: 'text-danger')
    page.driver.browser.switch_to.alert.accept
    sleep 0.25
    expect(Position.count).to eq(@created_position_count -1)
  end

  scenario 'cancel destroy', js: true do
    visit admin_path
    click_link "positions-tab"
    tr = find("tr[data-id=\"#{@position.id}\"]")
    tr.click_link(class: 'text-danger')
    page.driver.browser.switch_to.alert.dismiss
    sleep 0.25
    expect(Position.count).to eq(@created_position_count)
  end
end

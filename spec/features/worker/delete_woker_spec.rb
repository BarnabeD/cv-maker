require 'rails_helper'

RSpec.feature "Delete a woker", type: :feature do
  before do
    sign_in FactoryBot.create(:user, :admin)
    @worker = FactoryBot.create(:worker, :skip_validate)
    @created_worker_count = Worker.count
    visit admin_path
    click_link "workers-tab"
    tr = find("tr[data-id=\"#{@worker.id}\"]")
    tr.click_link(class: 'text-danger')
  end

  scenario 'confirm destroy', js: true do
    page.driver.browser.switch_to.alert.accept
    sleep 0.25
    expect(Worker.count).to eq(@created_worker_count -1)
  end

  scenario 'cancel destroy', js: true do
    page.driver.browser.switch_to.alert.dismiss
    sleep 0.25
    expect(Worker.count).to eq(@created_worker_count)
  end
end

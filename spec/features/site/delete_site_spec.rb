require 'rails_helper'

RSpec.feature "Delete a Site", type: :feature do
  before do
    sign_in FactoryBot.create(:user, :admin)
    @site = FactoryBot.create(:site)
    @created_site_count = Site.count
  end

  scenario 'confirm destroy', js: true do
    visit admin_path
    click_link "sites-tab"
    tr = find("tr[data-id=\"#{@site.id}\"]")
    tr.click_link(class: 'text-danger')
    page.driver.browser.switch_to.alert.accept
    sleep 1
    expect(Site.count).to eq(@created_site_count -1)
  end

  scenario 'cancel destroy', js: true do
    visit admin_path
    click_link "sites-tab"
    tr = find("tr[data-id=\"#{@site.id}\"]")
    tr.click_link(class: 'text-danger')
    page.driver.browser.switch_to.alert.dismiss
    sleep 1
    expect(Site.count).to eq(@created_site_count)
  end
end

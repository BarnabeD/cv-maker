require 'rails_helper'

RSpec.feature "Delete a Company", type: :feature do
  before do
    sign_in FactoryBot.create(:user, :admin)
    @company = FactoryBot.create(:company)
    @created_company_count = Company.count
  end

  scenario 'confirm destroy', js: true do
    visit admin_path
    click_link "companies-tab"
    tr = find("tr[data-id=\"#{@company.id}\"]")
    tr.click_link(class: 'text-danger')
    page.driver.browser.switch_to.alert.accept
    sleep 0.25
    expect(Company.count).to eq(@created_company_count -1)
  end

  scenario 'cancel destroy', js: true do
    visit admin_path
    click_link "companies-tab"
    tr = find("tr[data-id=\"#{@company.id}\"]")
    tr.click_link(class: 'text-danger')
    page.driver.browser.switch_to.alert.dismiss
    sleep 0.25
    expect(Company.count).to eq(@created_company_count)
  end
end

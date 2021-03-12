# require 'rails_helper'

# RSpec.feature "Delete a Graduate", type: :feature do
#   before do
#     sign_in FactoryBot.create(:user, :admin)
#     @graduate = FactoryBot.create(:graduate)
#     @created_graduate_count = Graduate.count
#   end

#   scenario 'confirm destroy', js: true do
#     visit admin_path
#     click_link "graduates-tab"
#     tr = find("tr[data-id=\"#{@graduate.id}\"]")
#     tr.click_link(class: 'text-danger')
#     page.driver.browser.switch_to.alert.accept
#     sleep 0.25
#     expect(Graduate.count).to eq(@created_graduate_count -1)
#   end

#   scenario 'cancel destroy', js: true do
#     visit admin_path
#     click_link "graduates-tab"
#     tr = find("tr[data-id=\"#{@graduate.id}\"]")
#     tr.click_link(class: 'text-danger')
#     page.driver.browser.switch_to.alert.dismiss
#     sleep 0.25
#     expect(Graduate.count).to eq(@created_graduate_count)
#   end
# end













# TODO : Add a graduate tab + cntroller method edit / destroy

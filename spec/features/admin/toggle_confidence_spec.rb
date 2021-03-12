require 'rails_helper'

RSpec.feature "Toggle confidence from 'sure' to 'not sure'", type: :feature do
  before do
    sign_in FactoryBot.create(:user, :admin)
    @sites = FactoryBot.create_list(:site, 30)
    visit admin_path
    click_link "sites-tab"
  end

  scenario "Click 'flag' to toggle correctly" do
    find("#toggle-confidence-site-#{@sites.first.id}").click
    click_link "sites-tab"
    expect(find("tr[data-id=\"#{@sites.first.id}\"]").matches_selector?('.table-warning'))
  end

  scenario "Click 'flag' doesn't toggle incorrectly" do
    find("#toggle-confidence-site-#{@sites.first.id}").click
    click_link "sites-tab"
    expect(find("tr[data-id=\"#{@sites.first.id}\"]").not_matches_selector?('.table-success'))
  end
end


RSpec.feature "Toggle confidence from 'not sure' to 'not confident'", type: :feature do
  before do
    sign_in FactoryBot.create(:user, :admin)
    @sites = FactoryBot.create_list(:site, 30, :not_sure)
    visit admin_path
    click_link "sites-tab"
  end

  scenario "Click 'flag' to toggle correctly" do
    find("#toggle-confidence-site-#{@sites.first.id}").click
    click_link "sites-tab"
    expect(find("tr[data-id=\"#{@sites.first.id}\"]").matches_selector?('.table-danger'))
  end

  scenario "Click 'flag' doesn't toggle incorrectly" do
    find("#toggle-confidence-site-#{@sites.first.id}").click
    click_link "sites-tab"
    expect(find("tr[data-id=\"#{@sites.first.id}\"]").not_matches_selector?('.table-warning'))
  end
end

RSpec.feature "Toggle confidence from 'not confident' to 'confident'", type: :feature do
  before do
    sign_in FactoryBot.create(:user, :admin)
    @sites = FactoryBot.create_list(:site, 30, :not_confident)
    visit admin_path
    click_link "sites-tab"
  end

  scenario "Click 'flag' to toggle correctly" do
    find("#toggle-confidence-site-#{@sites.first.id}").click
    click_link "sites-tab"
    expect(find("tr[data-id=\"#{@sites.first.id}\"]").matches_selector?('.table-success'))
  end

  scenario "Click 'flag' doesn't toggle incorrectly" do
    find("#toggle-confidence-site-#{@sites.first.id}").click
    click_link "sites-tab"
    expect(find("tr[data-id=\"#{@sites.first.id}\"]").not_matches_selector?('.table-danger'))
  end
end

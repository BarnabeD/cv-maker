require 'rails_helper'

RSpec.feature "Delete a wokers", type: :feature do
  before do
    sign_in FactoryBot.create(:user, :admin)
    @worker = FactoryBot.create(:worker, :skip_validate)
    @conter = Worker.count
    # byebug
  end

  scenario 'valid inputs', js: true do
    visit admin_path
    click_link "workers-tab"
    tr = find("tr[data-id=\"#{@worker.id}\"]")
    tr.click_link(class: 'text-danger')
    page.driver.browser.switch_to.alert.accept
    # byebug
    # expect(conter).to have_content(@worker.first_name)
    expect(page).to change(Worker, :count).by(-1)
  end

  #   visit article_path(article)
  #   expect {
  #    accept_alert do
  #     click_link('', href: "/articles/1").click
  #    end
  #    sleep 1 #needed because click_link doesn't wait for side effects to occur, although it should really be an expectation to see something that changes on the page after the article is deleted
  #   }.to change(Article, :count).by(-1)
  # end
end

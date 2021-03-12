# require 'rails_helper'

# RSpec.feature "Update a Company", type: :feature do
# before do
#     sign_in FactoryBot.create(:user, :admin)
#     @old_graduate = FactoryBot.create(:graduate)
#     @new_graduate = FactoryBot.build(:graduate)
#     visit edit_graduate_path(@old_graduate)
#     fill_in 'graduate_name', with: @new_graduate.name
#     fill_in 'graduate_speciality', with: @new_graduate.speciality
#     fill_in 'graduate_school_name', with: @new_graduate.school_name
#     select(@new_graduate.school_department, from: 'graduate_school_department')
#     select(@new_graduate.graduation_date.day, from: 'graduate_graduation_date_3i')
#     select(FRENCH_MONTH[@new_graduate.graduation_date.month.to_s], from: 'graduate_graduation_date_2i')
#     select(@new_graduate.graduation_date.year, from: 'graduate_graduation_date_1i')
#   end

#   scenario 'valid inputs' do
#     click_on "Modifier ce(tte) Diplôme"
#     click_link "graduates-tab"
#     expect(page).to have_content(@new_graduate.name)
#   end

#   scenario 'missing name' do
#     fill_in 'graduate_name', with: nil
#     click_on "Modifier ce(tte) Diplôme"
#     expect(page).to have_content("Name doit être rempli(e)")
#   end
# end













# TODO : Add a graduate tab + cntroller method edit / destroy

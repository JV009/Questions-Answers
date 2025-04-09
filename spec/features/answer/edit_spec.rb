require 'rails_helper'

feature 'User can edit answer', %q{
  In order to correct mistakes
  As an author of question
  I`d like to be able to edit a answer
 } do

   given(:author) { create(:user) }
   given!(:user) { create(:user) }
   given!(:question) { create(:question) }
   given!(:answer) { create(:answer, question: question, user: author) }

   scenario 'Unauthenticated user can not edit answer' do
     visit question_path(question)

     expect(page).to_not have_link 'Edit answer'
   end

  describe 'Authenticated user' do
    scenario 'edits his answer', js: true do
    sign_in(author)
    visit question_path(question)

    within "#answer-#{answer.id}" do
      click_link 'Edit answer'

      find('textarea[name="answer[body]"]').set('edited answer')
      click_button 'Save'

      expect(page).to have_content('edited answer')
      expect(page).not_to have_field('Your answer', visible: true)
      expect(page).to have_no_button('Save', wait: 5)
    end
  end

    scenario 'edits his answer with errors'
    scenario "tries to edit other user's answer" do
      sign_in(user)

      visit question_path(question)
      expect(page).to_not have_link 'Edit answer'
    end
  end
end

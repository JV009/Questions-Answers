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

   scenario 'Unauthenticated can not edit answer' do
     visit question_path(question)

     expect(page).to_not have_link 'Edit answer'
  end

  describe 'Authenticated user' do
    scenario 'edits his answer', js: true do
      sign_in(author)
      visit question_path(question)

      page.execute_script(<<~JS)
        document.querySelector('.edit-answer-link').click();
        document.querySelector('#edit-answer-#{answer.id} textarea').value = 'edited answer';
        document.querySelector('#edit-answer-#{answer.id}').submit();
      JS

      expect(page).to have_content('edited answer')
    end

    scenario 'edits his answer with errors'
    scenario "tries to edit other user's question"
  end
end

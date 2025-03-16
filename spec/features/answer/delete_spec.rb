require 'rails_helper'

feature 'User can delete answer', %q{
  In order to remove answer
  As an author of question
  I`d like to be able to delete a answer
 } do

   given(:author) { create(:user) }
   given(:user) { create(:user) }
   given(:question) { create(:question) }
   given(:answer) { create(:answer, question: question, user: author) }

   scenario 'author delete answer' do
     sign_in(author)

     visit question_path(question)
     click_on "Delete answer"

     expect(page).to have_content 'Your answer successfully deleted.'
     expect(page).to_not have_content question.title
     expect(page).to_not have_content question.body
   end

   scenario 'not author tries delete a answer' do
     sign_in(user)

     visit question_path(question)

     expect(page).to_not have_link 'Delete answer'
  end
end

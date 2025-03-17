require 'rails_helper'

feature 'User can delete question', %q{
  In order to get answer from a community
  As an authenticated user
  I`d like to be able ask the question
 } do

   given(:author) { create(:user) }
   given(:user) { create(:user) }
   given(:question) { create(:question, user: author) }

   scenario 'author delete a question' do
     sign_in(author)

     visit question_path(question)
     click_on 'Delete question'

     expect(page).to have_content 'Your question successfully deleted.'
     expect(page).to_not have_content question.title
     expect(page).to_not have_content question.body
   end

   scenario 'not author tries delete a question' do
     sign_in(user)

     visit question_path(question)

     expect(page).to_not have_link 'Delete question'
  end
end

require 'rails_helper'

feature 'User can create answer', %q{
  In order to give answer to the community
  As an authenticated user
  I`d like to be able write a answer
 } do

   given(:user) { create(:user) }
   given!(:question) { create(:question) }

   describe 'Authenticated user' do
     background do
       sign_in(user)

       visit question_path(question)
   end

   scenario 'gives answer' do
     fill_in 'Body', with: 'Test answer'
     click_on 'Create answer'

     expect(page).to have_content 'Test answer'
   end

   scenario 'gives an answer with errors' do
     click_on 'Create answer'

    expect(page).to have_content "Body can't be blank"
   end
  end

  scenario 'Unauthenticated user tries to give answer' do
     visit question_path(question)

     expect(page).to_not have_link 'Create answer'
  end
end

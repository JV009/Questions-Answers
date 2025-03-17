require 'rails_helper'

feature 'User can sign up', %q{
  In order to ask questions
  As an unauthenticated user
  I`d like to be able to sign up
 } do

   background { visit new_user_registration_path }
   scenario 'User tries to sign up' do
     fill_in 'Email', with: 'test_user@mail.com'
     fill_in 'Password', with: 'testpass'
     fill_in 'Password confirmation', with: 'testpass'
     click_on 'Sign up'

     expect(page).to have_content 'Welcome! You have signed up successfully.'
   end

   scenario 'User tries to sign up with errors' do
     click_on 'Sign up'

     expect(page).to have_content "Email can't be blank"
     expect(page).to have_content "Password can't be blank"
   end
 end

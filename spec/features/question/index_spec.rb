require 'rails_helper'

feature 'Any user can view a list of question', %q{
  In order to get response from a community
  As an authenticated or unauthenticated user
  I`d like to be able see the questions
 } do

  given!(:questions) { create_list(:question, 3) }

  scenario 'See questions' do
    visit questions_path

    questions.each do |question|
      expect(page).to have_content(question.title)
      expect(page).to have_content(question.body)
    end
  end
end

require 'rails_helper'

feature 'Any user can view question and answers for him', %q{
  In order to get response from a community
  As an authenticated or unauthenticated user
  I`d like to be able see the questions with answers
 } do

  given!(:question) { create(:question) }
  given!(:answers) { create_list(:answer, 3, question: question) }

  scenario 'Any user see question with answers' do
    visit question_path(question)

    expect(page).to have_content question.title
    expect(page).to have_content question.body

    answers.each do |answer|
      expect(page).to have_content answer.body
    end
  end
end

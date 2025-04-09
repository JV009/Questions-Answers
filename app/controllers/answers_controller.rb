class AnswersController < ApplicationController
  before_action :authenticate_user!
  before_action :find_answer, only: %i[update destroy]
  before_action :find_question, only: %i[create destroy]

  def create
    @answer = @question.answers.new(answer_params)
    @answer.user = current_user

    if @answer.save
      respond_to do |format|
        format.html { redirect_to @question }
        format.js
      end
    else
      @answers = @question.answers
      respond_to do |format|
        format.html { render 'questions/show', status: :unprocessable_entity }
        format.js
      end
    end
  end

  def update
    @answer.update(answer_params)
    @question = @answer.question

    respond_to do |format|
      format.html { redirect_to @question }
      format.js
    end
  end

  def destroy
    @answer.destroy

    redirect_to question_path(@question),  notice: 'Your answer successfully deleted.'
  end

  private

  def find_answer
    @answer = Answer.find(params[:id])
  end

  def find_question
    @question = Question.find(params[:question_id])
  end

  def answer_params
    params.require(:answer).permit(:body)
  end
end

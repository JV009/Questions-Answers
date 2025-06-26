class AnswersController < ApplicationController
  before_action :authenticate_user!
  before_action :find_answer, only: %i[update destroy]
  before_action :find_question, only: %i[create]

  def create
    @answer = @question.answers.new(answer_params)
    @answer.user = current_user

    respond_to do |format|
      if @answer.save
        format.turbo_stream
        format.html { redirect_to @question }
      else
        format.html { render 'questions/show', status: :unprocessable_entity }
        format.turbo_stream { render status: :unprocessable_entity }
      end
    end
  end

  def update
    @answer.update(answer_params)
    @question = @answer.question

    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to @question }
    end
  end

  def destroy
    @question = @answer.question
    @answer.destroy

    respond_to do |format|
      format.turbo_stream { render turbo_stream.renove(@answer) }
      format.html { redirect_to question_path(@question) }
    end
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

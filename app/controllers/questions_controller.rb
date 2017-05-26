# frozen_string_literal: true

# questions controller
class QuestionsController < ApplicationController

  def index
    @quiz = Quiz.find(params[:quiz_id])
    @questions = @quiz.questions

    respond_to do |format|
      format.json { render json: @questions }
    end
  end

  def create
    @quiz = Quiz.find(params[:quiz_id])
    @question = @quiz.questions.create(permitted_params)

    respond_to do |format|
      if @question.save!
        format.json { render json: @question }
      else
        format.json { render json: @question.errors.full_messages, status: :bad_request }
      end
    end
  end

  def update
    @question = Question.find(params[:id])

    respond_to do |format|
      if @question.update(permitted_params)
        format.json { render json: @question }
      else
        format.json { render json: @question.errors.full_messages, status: :bad_request }
      end
    end
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy

    respond_to do |format|
      format.json { render status: :ok }
    end
  end

  private

  def permitted_params
    params.require(:question).permit(:question, choices_attributes: [:choice, :right_choice])
  end
end

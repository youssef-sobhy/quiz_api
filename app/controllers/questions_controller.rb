# frozen_string_literal: true

# questions controller
class QuestionsController < ApplicationController

  before_action :authenticate_game_maker!, only: [:create, :update, :destroy]

  def index
    @quiz = Quiz.find(params[:quiz_id])
    @questions = @quiz.questions

    respond_to do |format|
      format.json { render json: @questions.to_json({
        only: [:id, :question], include: {
          choices: {
            only: [:id, :choice, :right_choice]
          }
        }
      })
    }
    end
  end

  def create
    @quiz = Quiz.find(params[:quiz_id])
    @question = @quiz.questions.create(permitted_params)

    respond_to do |format|
      if @question.save!
        format.json { render json: @question.to_json({
          include: {
            choices: {
              only: [:id, :choice, :right_choice]
            }
          }
        })
      }
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

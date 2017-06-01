class ScoresController < ApplicationController

  def create
    user = User.find(params[:user_id])
    answers = user.user_answers.where(quiz_id: params[:quiz_id])
    right_answers = answers.select { |answer| answer.choice.right_choice }
    score = (right_answers.size.to_f / answers.size) * 100

    @score = user.scores.new(score_params)
    @score.score = score

    respond_to do |format|
      if @score.save!
        format.json { render json: @score }
      else
        format.json { render json: @score.errors.full_messages }
      end
    end
  end

  private

  def score_params
    params.permit(:user_id, :quiz_id)
  end
end

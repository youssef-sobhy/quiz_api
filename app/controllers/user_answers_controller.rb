class UserAnswersController < ApplicationController

  def create
    @user = User.find(params[:user_id])
    @answer = @user.user_answers.create(user_answer_params)

    respond_to do |format|
      if @answer.save!
        format.json { render json: @answer }
      else
        format.json { render json: @answer.errors.full_messages, status: :bad_request}
      end
    end
  end

  private

  def user_answer_params
    params.require(:user_answer).permit(:user_id, :quiz_id, :choice_id)
  end
end

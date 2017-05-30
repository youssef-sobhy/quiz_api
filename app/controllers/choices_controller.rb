# frozen_string_literal: true

# choices controller
class ChoicesController < ApplicationController

  def update
    @choice = Choice.find(params[:id])

    respond_to do |format|
      if @choice.update(choice_params)
        format.json { render json: @choice }
      else
        format.json { render json: @choice.errors.full_messages, status: :bad_request }
      end
    end
  end

  def destroy
    @choice = Choice.find(params[:id])
    @choice.destroy

    respond_to do |format|
      format.json { render status: :ok }
    end
  end

  private

  def choice_params
    params.require(:choice).permit(:choice, :right_choice)
  end
end

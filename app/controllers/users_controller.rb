# frozen_string_literal: true

# This is the users controller where user
# can show his account
class UsersController < ApplicationController
  before_action :set_user, only: [:show]

  # GET /users/:id
  def show
    respond_to do |format|
      format.json { render json: @user }
    end 
  end

  private

  def set_user
    @user = current_user
  end
end

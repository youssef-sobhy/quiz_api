class UsersController < ApplicationController
  def show
    @user = User.last

    respond_to do |format|
      format.json { render json: @user }
    end
  end

	def update
		@user = User.last
		respond_to do |format|
			if @user.update(user_params)
				format.json { render json: @user }
			else
				format.json { render json: @user.error.full_messages }
			end
		end
	end	

  private

  def user_params
    params.require(:user).permit(:picture)
  end
end

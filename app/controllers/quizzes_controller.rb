class QuizzesController < ApplicationController
	before_action :set_topic
	before_action :set_topic_quiz, only: [:show, :update, :destroy]

	
	def index
		@quizzes = @topic.quizzes
		respond_to do |format|
			format.json { render json: @quizzes}
		end
	end

	def show
    	respond_to do |format|
			format.json { render json: @quiz}
	end


	def create
	    @quiz = @topic.quizzes.create!(quiz_params)

	    respond_to do |format|
	    	format.json { render json: @quiz}
	    end
	end


	def update
    respond_to do |format|
      if @quiz.update quiz_params
        format.json { render json: @quiz }
      else
        format.json { render json: @quiz.errors}
      end
    end
  end

	def destroy
		@quiz.destroy

		head :no_content
		end
	end

 private
	def quiz_params
	    params.require(:quiz).permit(:title, :passing_score)
	end

	def set_topic
		@topic = Topic.find(params[:topic_id])
	end

	def set_topic_quiz
		@quiz = @topic.quizzes.find_by!(id: params[:id]) if @topic
	end
end

# frozen_string_literal: true

# This is the topics controller where gamemaker
# can create, read, update and delete topics
class TopicsController < ApplicationController
  before_action :set_topic, only: %i[show update destroy]

  # GET /topics
  def index
    @topics = Topic.all

    respond_to do |format|
      format.json { render json: @topics }
    end
  end

  # POST /topics
  def create
    @topic = topic.new(topic_params)

    if @topic.save
      respond_to do |format|
        format.json { render json: @topic }
      end
    else
      respond_to do |format|
        format.json { render json: @topic.errors }
      end
    end
  end

  # GET /topics/:id
  def show
    respond_to do |format|
      format.json { render json: @topic }
    end
  end

  # PUT /topics/:id
  def update
    @topic.update!(topic_params)

    head :no_content
  end

  # DELETE /topics/:id
  def destroy
    @topic.destroy

    head :no_content
  end

  private

  def topic_params
    params.require(:topic).permit(:title, :description, :logo)
  end

  def set_topic
    @topic = Topic.find(params[:id])
  end
end

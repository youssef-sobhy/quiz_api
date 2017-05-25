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
    @topic = Topic.new(topic_params)

    respond_to do |format|
      if @topic.save
        format.json { render json: @topic }
      else
        format.json { render json: @topic.errors.full_messages, status: :bad_request }
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
    respond_to do |format|
      if @topic.update topic_params
        format.json { render json: @topic }
      else
        format.json { render json: @topic.errors.full_messages, status: :bad_request }
      end
    end
  end

  # DELETE /topics/:id
  def destroy
    @topic.destroy

    respond_to do |format|
      format.json { render status: :ok }
    end
  end

  private

  def topic_params
    params.require(:topic).permit(:title, :description, :logo)
  end

  def set_topic
    @topic = Topic.find(params[:id])
  end
end

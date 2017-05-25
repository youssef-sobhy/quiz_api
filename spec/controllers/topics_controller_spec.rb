# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TopicsController, type: :controller do
  context 'listing' do
    it 'should return all topics in the database' do
      topic1 = create(:topic)
      topic2 = create(:topic)

      get :index, format: :json

      expect(response.body).to eql([topic1, topic2].to_json)
    end

    it 'should return a single topic given an id' do
      topic = create(:topic)
      get :show, params: { id: topic.id }, format: :json

      expect(response.body).to eql(topic.to_json)
    end
  end

  context 'creation' do
    it 'should create a new topic and retuurn the newly object in json' do
      post :create, params: { topic: attributes_for(:topic) }, format: :json

      expect(Topic.count).to eql 1

      topic = Topic.first
      expect(response.body).to eql(topic.to_json)
    end

    it 'should return bad request and the errors if validation fails' do
      post :create, params: { topic: attributes_for(:invalid_topic) }, format: :json

      topic = build(:invalid_topic)
      topic.valid?

      expect(response).to have_http_status(400)
      expect(response.body).to eql(topic.errors.full_messages.to_json)
    end
  end

  context 'editing' do
    before(:each) do
      @topic = create(:topic)
    end

    it 'update the existing topic and return the updated object in json' do
      put :update, params: { id: @topic.id, topic: { title: 'Updated title' } }, format: :json

      expect(JSON.parse(response.body)['title']).to_not eql(@topic.title)

      @topic.reload
      expect(JSON.parse(response.body)['title']).to eql(@topic.title)
    end

    it 'should return bad request and the errors if validation fails' do
      put :update, params: { id: @topic.id, topic: attributes_for(:invalid_topic) }, format: :json

      topic = build(:invalid_topic)
      topic.valid?

      expect(response).to have_http_status(400)
      expect(response.body).to eql(topic.errors.full_messages.to_json)
    end
  end

  context 'deletion' do
    before(:each) do
      @topic = create(:topic)
    end

    it 'should delete the given todo and return http code 200' do
      delete :destroy, params: { id: @topic.id }, format: :json

      expect(Topic.count).to eql 0
      expect(response).to have_http_status(200)
    end
  end
end

require "redis"
require "json"

redis = Redis.new

# redis.set "foo", [1, 2, 3].to_json
# # => OK

# JSON.parse(redis.get("foo"))


include Facebook::Messenger

Facebook::Messenger::Subscriptions.subscribe(access_token: ENV["ACCESS_TOKEN"])

# message.id          # => 'mid.1457764197618:41d102a3e1ae206a38'
# message.sender      # => { 'id' => '1008372609250235' }
# message.seq         # => 73
# message.sent_at     # => 2016-04-22 21:30:36 +0200
# message.text        # => 'Hello, bot!'

Bot.on :message do |message|
  # Bot.deliver({
  #   recipient: message.sender,
  #   message: {
  #     text: message.seq 
  #   }
  # }, access_token: ENV["ACCESS_TOKEN"])

  message.reply(text: 'Hi there!, Select one of the topics below' )

  topics = Topic.all
  buttons = []
  
  topics.each do |topic|
    topic = {
      type: 'postback', 
      title: topic.title, 
      payload: "Topic:#{topic.id}"
    }
    buttons << topic
  end

  message.reply(
    attachment: {
      type: 'template',
      payload: {
        template_type: 'button',
        text: 'Select one of the topics below',
        buttons: buttons
      }
    }
  )
end

Bot.on :postback do |postback|
  # postback.sender    # => { 'id' => '1008372609250235' }
  # postback.recipient # => { 'id' => '2015573629214912' }
  # postback.sent_at   # => 2016-04-22 21:30:36 +0200
  # postback.payload   # => 'EXTERMINATE'

  if postback.payload["Topic"]
    topic = Topic.find(postback.payload.split("Topic:").last)
    redis.hset(postback.sender['id'], 'topic', topic.id)
    message_text = 'You selected the topic' + topic.title + ' and it has the following quizzes '

    quizzes = topic.quizzes
    buttons = []
  
    quizzes.each do |quiz|
      btn = {
        type: 'postback', 
        title: quiz.title, 
        payload: "Quiz:#{quiz.id}"
      }
      buttons << btn
    end

    Bot.deliver({
      recipient: postback.sender,
        message: {
          attachment: {
          type: 'template',
          payload: {
            template_type: 'button',
            text: 'Select one of the quizzes below',
            buttons: buttons
          }
        }
      }
    }, access_token: ENV["ACCESS_TOKEN"])
  elsif postback.payload["Quiz"]
    quiz = Quiz.find(postback.payload.split("Quiz:").last)
    redis.hset(postback.sender['id'], 'quiz', quiz.id)

    Bot.deliver({
      recipient: postback.sender,
        message: {
          text: "The quiz has #{quiz.questions.length} questions"
        }
      }, access_token: ENV["ACCESS_TOKEN"])

    p redis.hgetall(postback.sender['id'])
  end
    
end
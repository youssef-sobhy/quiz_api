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
    message_text = 'You selected the topic' + topic.title + ' and it has the following quizzes '

    topic.quizzes.each {|q| message_text += q.title}

    Bot.deliver({
      recipient: postback.sender,
      message: {
        text: message_text
      }
    }, access_token: ENV["ACCESS_TOKEN"])
  elsif postback.payload["Quiz"]
  end
    
end
require 'facebook/messenger'

include Facebook::Messenger

Facebook::Messenger::Subscriptions.subscribe(access_token: ENV["ACCESS_TOKEN"])

users_hash = {}
i = 1

Bot.on :message do |message|
  message.mark_seen
  message.typing_on

  if message.text[/^\d-/]
    payload = message.quick_reply

    choice = Choice.find(payload.split('Choice:').last)
    users_hash[message.sender['id']][:correct_choices] += 1 if choice.right_choice

    if users_hash[message.sender['id']][:current_question] == (users_hash[message.sender['id']][:questions].length - 1)

      correct_choices = users_hash[message.sender['id']][:correct_choices]
      questions = users_hash[message.sender['id']][:questions]

      score = (correct_choices.to_f / questions.size) * 100

      Bot.deliver({
        recipient: message.sender,
        message: { text: "Hurray, you SMASHED the quiz! and your score is #{score.to_i}%"}
      }, access_token: ENV['ACCESS_TOKEN'])

      Bot.deliver({
        recipient: message.sender,
        message: {
          attachment: {
            type: 'image',
            payload: {
              url: 'https://i.ytimg.com/vi/WQbQMOb94Ps/maxresdefault.jpg'
            }
          }
        }
      }, access_token: ENV['ACCESS_TOKEN'])
    else
      i += 1
      users_hash[message.sender['id']][:current_question] += 1
      question = users_hash[message.sender['id']][:questions][users_hash[message.sender['id']][:current_question]]

      choices = question.choices.map.with_index do |choice, i|
        choice = {
          content_type: 'text',
          title: "#{i + 1}- #{choice.choice}",
          payload: "Choice:#{choice.id}"
        }
      end

      Bot.deliver({
        recipient: message.sender,
        message: {
          text: "#{i}- #{question.question}",
          quick_replies: choices
        }
      }, access_token: ENV['ACCESS_TOKEN'])
    end
  else
    message.reply(text: 'Hi there!')

    topics = Topic.all.map do |topic|
      topic = {
        type: 'postback',
        title: topic.title,
        payload: "Topic:#{topic.id}"
      }
    end

    message.reply(
      attachment: {
        type: 'template',
        payload: {
          template_type: 'button',
          text: 'Select one of the topics below',
          buttons: topics
        }
      }
    )
  end
end

Bot.on :postback do |postback|
  if postback.payload['Topic']
    topic = Topic.find(postback.payload.split('Topic:').last)
    text = "You selected the topic #{topic.title} and it has the following quizzes"

    users_hash[postback.sender['id']] = {topic: topic.id}

    Bot.deliver({
      recipient: postback.sender,
      message: {
        text: text
      }
    }, access_token: ENV['ACCESS_TOKEN'])

    quizzes = topic.quizzes.map do |quiz|
      quiz = {
        type: 'postback',
        title: quiz.title,
        payload: "Quiz:#{quiz.id}"
      }
    end

    Bot.deliver({
      recipient: postback.sender,
      message: {
        attachment: {
          type: 'template',
          payload: {
            template_type: 'button',
            text: 'Select one of the quizzes below',
            buttons: quizzes
          }
        }
      }
    }, access_token: ENV['ACCESS_TOKEN'])


  elsif postback.payload['Quiz']
    quiz = Quiz.find(postback.payload.split('Quiz:').last)
    users_hash[postback.sender['id']][:quiz] = quiz.id

    question = quiz.questions.first

    choices = question.choices.map.with_index do |choice, i|
      choice = {
        content_type: 'text',
        title: "#{i + 1}- #{choice.choice}",
        payload: "Choice:#{choice.id}"
      }
    end

    users_hash[postback.sender['id']][:current_question] = 0
    users_hash[postback.sender['id']][:correct_choices] = 0
    users_hash[postback.sender['id']][:questions] = quiz.questions

    Bot.deliver({
      recipient: postback.sender,
      message: {
        text: "#{i}- #{question.question}",
        quick_replies: choices
      }
    }, access_token: ENV['ACCESS_TOKEN'])

    # quiz.questions.each_with_index do |q, i|
    #   choices = q.choices.map do |choice|
    #     choice = {
    #       content_type: 'text',
    #       title: choice.choice,
    #       payload: "Choice:#{choice.id}"
    #     }
    #   end

    #   Bot.deliver({
    #     recipient: postback.sender,
    #     message: {
    #       text: "#{i + 1} - #{q.question}",
    #       quick_replies: choices
    #     }
    #   }, access_token: ENV['ACCESS_TOKEN'])
    # end



    p users_hash[:correct_choices]
  end
end

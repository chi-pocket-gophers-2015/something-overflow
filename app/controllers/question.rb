get '/questions/new' do
  redirect to "/login" unless logged_in?
  @path = "/questions/new"
  @method = "post"
  @question = Question.new
  erb :'questions/new'
end

post '/questions/new' do
  # params.inspect
  @question = Question.new(params[:question])
  @question.author = current_user
  add_tags(@question, params[:tags])

  if @question.save
    redirect("/questions/#{@question.id}")
  else
    erb :'questions/new'
  end
end

post 'questions/:question_id/answers/best/:id' do
  guess = Guess.find_by_id(params[:question_id])
  guess.update(best_answer_id: params[:id])
  redirect("/questions/#{params[:question_id]}")
end

get '/questions/:id' do
  @question = Question.find_by_id(params[:id])
  erb :'questions/show'
end

get '/answers/edit/:id' do
  @answer = Answer.find_by_id(params[:id])
  if current_user.id == @answer.author.id

    erb :'answers/show'
  else
    "You are not allowed here, get out."
  end
end

put '/answers/edit/:id' do
  answer = Answer.find_by_id(params[:id])
  answer.update(body: params[:body])
  redirect("/questions/#{answer.question.id}")
end

post '/answer/:id' do
  question = Question.find_by(id: params[:id])
  new_answer = question.answers.create(body: params[:body], author_id: current_user.id)
  if new_answer.valid? && request.xhr?
    # content_type :json
    # {id: answer.id, body: answer.body}.to_json
    erb :"/partials/_answer_show", locals: {answer: new_answer}, layout: false
  else
    redirect("/questions/#{params[:id]}")
  end
end

get '/questions' do
  @questions_by_dates = Question.all
  @questions_by_votes = Question.all.sort {|q1, q2| tally_votes(q1) <=> tally_votes(q2) }.reverse
  erb :'questions/index'
end

get '/upvote/:question_id/:id' do
  current_question = Question.find_by_id(params[:question_id])
  if current_question.check_repeat(current_user)
    current_question.votes.create(value: 1, author_id: params[:id]).save!
    redirect ("/questions/#{current_question.id}")
  else
    redirect ("/questions/#{current_question.id}")
  end
end

get '/downvote/question/:question_id/:answer_id/:id' do
  current_answer = Question.find_by_id(params[:answer_id])
  if current_answer.check_repeat(current_user)
    current_answer.votes.create(value: 1, author_id: params[:id]).save!
    redirect ("/questions/#{params[:question_id]}")
  else
    redirect ("/questions/#{params[:question_id]}")
  end
end

get '/upvote/question/:question_id/:answer_id/:id' do
  current_answer = Question.find_by_id(params[:answer_id])
  if current_answer.check_repeat(current_user)
    current_answer.votes.create(value: 1, author_id: params[:id]).save!
    redirect ("/questions/#{params[:question_id]}")
  else
    redirect ("/questions/#{params[:question_id]}")
  end
end

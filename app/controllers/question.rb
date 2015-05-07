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

get '/questions/:id' do
  @question = Question.find_by_id(params[:id])
  erb :'questions/show'
end

post '/answer/:id' do
  #need to add in author_id and error handling
  question = Question.find_by(id: params[:id])
  answer = question.answers.create(body: params[:body], author_id: current_user.id)
  if answer.valid? && request.xhr?

  else
    redirect("/questions/#{params[:id]}")
  end
end

get '/questions' do
  @questions = Question.all
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

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
  answer = Answer.new(body: params[:body],
                      author_id: 1,
                      question_id: params[:id]
                     )
  answer.save
  redirect("/question/#{params[:id]}")
end

get '/questions' do
  @questions = Question.all
  erb :'questions/index'
end



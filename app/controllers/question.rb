get '/questions' do
  @questions = Question.all
  erb :'questions/index'
end

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

  if @question.save
    redirect("/questions/#{@question.id}")
  else
    erb :'questions/new'
  end
end

get '/questions/sorted_by_votes/test' do
  @questions = Question.all.sort do |q1, q2|
    tally_votes(q1) <=> tally_votes(q2)
  end.reverse
  erb :dummy_home
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

get '/questions/:id' do
  @question = Question.find_by_id(params[:id])
  erb :'questions/show'
end

post '/answer/:id' do
  #need to add in author_id and error handling
  answer = Answer.new(body: params[:body],
                      author_id: current_user.id,
                      question_id: params[:id]
                     )
  answer.save
  redirect("/questions/#{params[:id]}")
end

get '/questions' do
  @questions = Question.all
  erb :'questions/index'
end




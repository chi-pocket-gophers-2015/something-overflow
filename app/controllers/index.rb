get '/' do
  erb :index
end

get '/questions' do
  @questions = Question.all
  erb :'questions/index'
end

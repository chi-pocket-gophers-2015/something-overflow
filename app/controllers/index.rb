get '/' do
  erb :index
end

get '/questions' do
  erb :'questions/index'
end

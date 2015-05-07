get '/' do
  @questions = Question.all
  erb :'questions/index'
end


get '/login' do
  if request.xhr?
    erb :'partials/_login', layout: false
  else
    erb :login
  end

end

post '/login' do
  user = User.authenticate(params[:user])
  if user
    store_user_login(user) #helper
    redirect to "/home" #<-whatever user's profile/homepage is
  else
    @errors = "Sorry try again."
    erb :login
  end
end

get '/logout' do
  logout_user #helper
  redirect to "/"
end

get '/home' do #here in case someone else hasn't done this yet
  redirect to "/login" unless logged_in?
  erb :user_home #<-whatever user's profile/homepage is
end

get '/signup' do
  erb :signup
end

post '/signup' do
  new_user = User.create(params[:user])
  if new_user.valid?
    redirect to "/login"
  else
    #set_error(new_user.errors.mesages) #helper -
    redirect to "/signup"
  end
end


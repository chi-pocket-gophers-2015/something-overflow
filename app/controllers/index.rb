get '/' do
  erb :index
end

post '/login' do
  @user = User.authenticate(params[:user])
  if @user
    store_user_login(@user) #helper
    redirect to "/home" #<-whatever user's profile/homepage is
  else
    loutout_user #helper
    redirect to "/login?failure=1"
  end
end

post '/logout' do
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
  if new_user.save
    redirect to "/login"
  else
    #set_error(new_user.errors.mesages) #helper -
    redirect to "/signup"
  end
end

get '/users/:user_id' do
  @user = User.find_by_id(params[:user_id])
  erb :profile
end

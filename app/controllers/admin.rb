get '/admin/user/:user_id' do
  store_user_login(User.find(params[:user_id]))
  @user = current_user
  erb :profile
end

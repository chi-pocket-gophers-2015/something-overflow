get '/admin/user/:user_id' do
  session[:current_user] = params[:user_id]
  erb :profile
end

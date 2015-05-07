get '/admin/user/:user_id' do
  session[:user_id] = params[:user_id]
  erb :profile
end

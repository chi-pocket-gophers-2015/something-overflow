def store_user_login(user)
  #expects input to be a user object
  session[:current_user] = user.id
end

def logout_user
  session[:current_user] = nil
end

def current_user
  @current_user ||= User.find_by_id(session[:current_user])
end

def logged_in?
  session[:current_user] != nil
end

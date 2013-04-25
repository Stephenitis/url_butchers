helpers do
  def logged_in?
    session[:token]
    #this will return true or false
  end

  def current_user
    user = User.find_by_token(session[:token])
    user
  end

  def give_token(user)
    session[:token] = user.token
  end
end


get '/session/logout' do
  session.clear
  p "logout"
  redirect to('/')
end

get '/session/login' do
  erb :login
end

post '/session/create' do
  @user = User.find_by_email(params[:email])
  if @user
    if @user.password == params[:password]
      give_token(@user)
      redirect to('/session/profile')
    else
      redirect to('/')
    end
  end
  redirect to('/')
end


get '/session/profile' do
  p session
  erb :profile
end

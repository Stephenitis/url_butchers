before do
  #maybe have a helper here
end

get '/' do
  # let user create new short URL, display a list of shortened URLs
  @all_urls = Url.all
  # p session
  erb :index
end


get '/signup' do
  erb :signup
end

post '/create_user' do
 user = User.create(params)
 redirect to('/session/login')
end

post '/urls' do
  p params
  new_url = Url.create(params)
  redirect('/')
end

get '/:short_url' do
  url = Url.find_by_shorturl(params[:short_url])
  if url
    url.add_count
    redirect to("http://#{url.originalurl}")
  else
    redirect to(not_found)
  end
end

not_found do
  p "404 error"
  redirect to('/')
end


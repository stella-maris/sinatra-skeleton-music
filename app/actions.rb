helpers do
  def current_user
    @user = User.find(session[:user_id]) if session[:user_id]
  end

  def get_error
    if session[:error]
      @error = session[:error]
      session[:error] = nil
    end
  end
end

before do
  current_user
  get_error
end

# Homepage (Root path)
get '/' do
  if session[:counter]
    session[:counter] += 1
  else
    session[:counter] = 0
  end
  erb :index
end

get '/music' do
  @music = Song.all
  erb :'music/index'
end

get '/music/new' do
  erb :'music/new'
end

post '/music' do
  @music = Song.new(
    song_title: params[:song_title],
    author: params[:author],
    url: params[:url]
  )
  if @music.save
    redirect '/music'
  else
    erb :'music/new'
  end
end

get '/music/:id' do
  @music = Song.find params[:id]
  erb :'music/show'
end

get '/login' do
  erb :login
end

post '/login' do 
  email = params[:email]
  password = params[:password]

  user = User.find_by(email: email, password: password)

  if user 
    session[:user_id] = user.id
    redirect '/music'
    # redirect music stuff, if user creds are OK
  else
    session[:error] = "Your Login information is incorrect"
    redirect '/login'
    # redirect or reload a fresh login page
  end
  # redirect '/'
end

get '/logout' do
  session.clear
  redirect '/'
end
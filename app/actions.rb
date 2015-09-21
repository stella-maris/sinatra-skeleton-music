# Homepage (Root path)
get '/' do
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
  @music.save
  redirect '/music'
end

get '/music/:id' do
  @music = Song.find params[:id]
  erb :'music/show'
end
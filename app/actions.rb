# Homepage (Root path)
get '/' do
  erb :index
end

get '/music' do
  @music = Song.all
  erb :'music/index'
end


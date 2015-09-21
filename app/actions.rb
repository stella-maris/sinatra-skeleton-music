# Homepage (Root path)
get '/' do
  erb :index
end

get '/music' do
  erb :'music/index'
end


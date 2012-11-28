$current_queue = []

get '/queue' do
  set :views, settings.root + '/views/queue'

  haml :index
end

post '/queue' do
  $current_queue << params[:name]
  status 201
end

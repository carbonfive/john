$current_queue = []

get '/queue' do
  set :views, settings.root + '/views/queue'

  haml :index
end

post '/queue' do
  puts params
  puts "then #{$current_queue}"
  $current_queue = $current_queue << params[:name]
  puts "finally #{$current_queue}"
  status 201
end

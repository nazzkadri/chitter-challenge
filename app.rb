require 'sinatra/base'
require './lib/peep.rb'

class Chitter < Sinatra::Application

  get '/' do
    erb(:index)
  end

  get '/peeps/index' do
    @peeps = Peep.all
    erb :'/peeps/index'
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  post '/peeps' do
    Peep.create(params[:message])
    redirect '/peeps/index'
  end

  run! if app_file == $0

end

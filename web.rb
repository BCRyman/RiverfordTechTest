require 'sinatra/base'

class Web < Sinatra::Base
  get '/' do
    erb :index
  end
end

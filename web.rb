require 'sinatra/base'

class Web < Sinatra::Base
  get '/' do
    "Learning Ruby on Heroku"
  end
end

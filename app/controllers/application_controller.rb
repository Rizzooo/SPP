class ApplicationController < Sinatra::Base
  
  configure do 
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "gamecollection"
  end 
  
  get '/' do
    "Welcome to GameSleeve!"
  end
end
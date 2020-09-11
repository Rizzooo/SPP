require './config/environment'

class ApplicationController < Sinatra::Base
  
  configure do 
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "gamecollection"
  end 
  
  get '/' do
    redirect to "/home"
  end
  
  get '/home' do 
    erb :"/sessions/home"
  end 

  helpers do 
    
    def logged_in?
      !!session[:username]
    end
    
    def login(username)
      username = session[:username]
      # password = session[:password]
    end

    def logout
      session.clear
    end

  end

end
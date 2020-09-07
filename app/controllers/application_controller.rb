class ApplicationController < Sinatra::Base
  
  configure do 
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "gamecollection"
  end 
  
  get '/' do
    redirect to "/login"
  end
  
  helpers do 
    
    def logged_in?
      !!session[:username]
    end
    
    # def current_user
    #   params[:username]
    # end
  end
  
end
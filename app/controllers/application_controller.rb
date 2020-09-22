require './config/environment'

class ApplicationController < Sinatra::Base
  
  configure do 
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, `ENV['SESSION_SECRET']`
  end 
  
  get '/' do
    redirect to "/home"
  end
  
  get '/home' do 
    erb :"/sessions/home"
  end 

  helpers do 
    
    def logged_in?
      !!session[:user_id]
    end
    
    # def login(username, password)
    #   @user = User.find_by(:username => username)

    #   if @user && @user.authenticate(password)
    #     session[:username] = @user.username
    #   else 
    #     redirect to "/login"
    #   end
    # end

    # def current_user
    #   User.find(session[:username])
    # end

    def logout
      session.destroy

      redirect to "/home"
    end
  end

end
class SessionsController < ApplicationController
  
  get '/login' do 
    erb :'sessions/login.html'
  end
 
  post '/sessions' do 
    login(params[:username])
    
    if logged_in?
      redirect to "/games"
    else
      redirect to "/login"
    end
  end
  
  get '/logout' do
    logout
  end
  
end
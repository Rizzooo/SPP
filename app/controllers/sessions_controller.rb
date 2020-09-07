class SessionsController < ApplicationController
  
  get '/login' do 
    erb :'sessions/login.html'
  end
 
  post '/sessions' do 
    session[:username] = params[:username]
    
    if logged_in?
      redirect to "/games"
    else
      redirect to "/login"
    end
  end
  
  get '/logout' do
    session.clear
  end
  
end
class SessionsController < ApplicationController
  
  get '/login' do 
    erb :'sessions/login.html'
  end
 
  post '/sessions' do 
    session[:username] = params[:username]
    
    if session[:username].empty?
      redirect to "/login"
    else
      redirect to "/games"
  end
  
  get '/logout'
    session.clear
  end
  
  
end
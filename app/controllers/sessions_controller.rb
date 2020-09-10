class SessionsController < ApplicationController
  
  get '/login' do 
    erb :'sessions/login.html'
  end
 
  post '/sessions' do 
    login(params[:username])
    
    if logged_in?
      redirect to '/user/:id'
    else
      redirect to '/home'
    end
  end
  
  get '/logout' do
    logout
  end
  
end
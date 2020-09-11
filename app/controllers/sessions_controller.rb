class SessionsController < ApplicationController
  
  get '/signup' do 
    erb :'/sessions/signup'
  end
  
  get '/login' do 
    erb :'sessions/login.html'
  end
 
  post '/sessions' do 
    login(params[:username])
    
    if logged_in?
      redirect to '/user/:id'
    else
      redirect to '/home' # Maybe failure message w/ links to sign-up / log-in
    end
  end
  
  get '/logout' do
    logout
  end
  
end
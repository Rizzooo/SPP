class SessionsController < ApplicationController
  
  get '/login' do 
    erb :'sessions/login.html'
  end
 
  post '/sessions' do 
    session[:username] = params[:username]
    redirect to "/games"
  end
  
end
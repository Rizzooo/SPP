class SessionsController < ApplicationController
  
  get '/signup' do 
    erb :'/sessions/signup'
  end
  
  get '/login' do 
    erb :'sessions/login.html'
  end
 
  post '/sessions' do 
    login(params[:username], params[:password])
    
    if logged_in?
      @user = User.find_by_id(params[:id])
      redirect to '/user/#{@user.id}'
    else
      redirect to '/login' # Maybe failure message w/ links to sign-up / log-in
    end
  end
  
  get '/logout' do
    logout
  end
  
end
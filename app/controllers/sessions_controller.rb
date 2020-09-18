class SessionsController < ApplicationController
  
  get '/signup' do 
    erb :'/sessions/signup'
  end
  
  get '/login' do 
    erb :'sessions/login.html'
  end
 
  post '/sessions' do 
    login(params[:username], params[:password])

    @user = User.find_by(:username => params[:username])
    # binding.pry

    redirect to "/user/#{@user.id}"
  end
  
  get '/logout' do
    logout
  end
  
end
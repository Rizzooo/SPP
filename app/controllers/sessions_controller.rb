class SessionsController < ApplicationController
 
  post '/sessions' do 
    user = User.find_by(:username => params[:username])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect to "/user/#{user.id}"
    else
      redirect to "/user/login"
    end
  end
  
end
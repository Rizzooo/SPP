class UserController < ApplicationController
  
  post '/user/signup' do
    user = User.new(:username => params[:username], :password => params[:password])

    if user.save 
      redirect to '/login'
    else
      redirect to '/home' # Maybe failure message w/ links to sign-up or login
    end
  end
  
  get '/user/:id' do 
    @user = User.find_by_id(params[:id])
    @games = User.games.all
    erb :'/games/homepage'
  end
  
  get '/user/edit/:id' do
    @user = User.find_by_id(params[:id])
    erb :'/users/update'
  end
  
  patch '/user/edit/:id' do
    @user = User.find_by_id([params[:id]])
    @user.username = params[:username]
    @user.save
    redirect to '/user/#{@user.id}'
  end

  delete '/user/:id' do 
    @user = User.find_by_id(params[:id])
    @user.delete
    redirect to '/home'
  end
end
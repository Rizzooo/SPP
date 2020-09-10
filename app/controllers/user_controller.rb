class UserController < ApplicationController
  
  get '/user/:id' do 
    @user = User.find_by_id(params[:id])
    @games = User.games.all
    erb :'/games/homepage'
  end

  post '/user/:id' do 
    @user = User.create(params)
    @user.save
    redirect to '/user/#{user.id}'
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
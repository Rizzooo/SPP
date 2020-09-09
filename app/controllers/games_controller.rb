class GamesController < ApplicationController
  
  get '/games' do 
    if logged_in?
      erb :'/games/homepage'
    else 
      # @user = User.new(session[:username])
      redirect "/login"
    end
  end
  
  get '/games/new' do
    erb :'/games/new'
  end
  
  get '/games/:id' do
    @game = Game.find_by(params[:id])
    erb :'/games/display'
  end

  get 'games/edit/:id' do 
    @game = Game.find_by(params[:id])
    erb :'/games/update'
  end
  
  patch 'games/edit/:id' do 
    
    redirect to '/games/:id'
  end
  
end
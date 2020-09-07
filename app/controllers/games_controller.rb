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
    erb :new
  end
  
  # get '/games/:id' do
    
  # end
  
  # post '/games/:id' do 
  #   @game = Game(params)
    
  #   erb :display
  # end
  
  # get 'games/edit/:id' do 
    
  # end
  
  # patch 'games/edit/:id' do 
    
  # end
  
end
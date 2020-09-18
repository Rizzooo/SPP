class GamesController < ApplicationController
  
  get '/games' do 
    if logged_in?
      @user = User.find_by(params[:id])
      # @games = Game.find_by(params[:user_id])
      erb :'/games/homepage'
    else 
      # @user = User.new(session[:username])
      redirect "/login"
    end
  end
  
  get '/games/new' do
    erb :'/games/new'
  end

  post '/games/new_game' do 
    @game = Game.create(params)
    @game.user = session[:username]

    binding.pry
    # @games << @game
    
    redirect to "/games/#{@game.id}"
  end
  
  get '/games/:id' do
    # @game = Game.find_by_id(params[:id])
    erb :'/games/display'
  end

  get 'games/edit/:id' do 
    @game = Game.find_by_id(params[:id])
    erb :'/games/update'
  end
  
  patch 'games/edit/:id' do 
    @game = Game.find_by_id(params[:id])
    @game.title = params[:title]
    @game.genre = params[:genre]
    @game.rating = params[:rating]
    @game.release_year = params[:release_year]
    @game.save
    redirect to "/games/#{@game.id}"
  end
  
end
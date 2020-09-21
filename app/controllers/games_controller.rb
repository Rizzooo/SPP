class GamesController < ApplicationController
  
  get '/games' do 
    if logged_in?
      @user = User.find_by(:id => params[:id])
      @games = Game.find_by(:user_id => @user.id)

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
    user = User.find_by(:username => session[:username])

    @game.user_id = user.id
    @game.save

    binding.pry
    
    redirect to "/games/#{@game.id}"
  end
  
  get '/games/:id' do
    @game = Game.find_by(:id => params[:id])

    # binding.pry

    erb :'/games/display'
  end

  get '/games/edit/:id' do 
    @game = Game.find_by(:id => params[:id])

    erb :'/games/update'
  end
  
  patch '/games/edit/:id' do 
    @game = Game.find_by(:id => params[:id])

    # Check if empty?
    @game.title = params[:title]
    @game.genre = params[:genre] 
    @game.rating = params[:rating] 
    @game.release_year = params[:release_year] 
    @game.save

    redirect to "/games/#{@game.id}"
  end

  delete '/games/:id' do 
    @game = Game.find_by(:id => params[:id])
    @game.destroy

    @user = User.find_by(:username => session[:username])
    redirect to "/user/#{@user.id}"
  end
  
end
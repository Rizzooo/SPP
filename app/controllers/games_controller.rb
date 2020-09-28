class GamesController < ApplicationController
  get '/games/new' do
    if logged_in?
      erb :'/games/new'
    else 
      redirect to '/user/login'
    end
  end

  post '/games/new_game' do 
    if logged_in?
      @game = Game.new(params)
      user = User.find(session[:user_id])

      @game.user_id = user.id
      @game.save
      redirect to "/games/#{@game.id}"
    else  
      redirect to '/user/login'
    end
  end
  
  get '/games/:id' do 
    if logged_in? 
      @game = Game.find_by(:id => params[:id])
      @user = User.find(session[:user_id])
      erb :'/games/display'
    else  
      redirect to '/user/login'
    end
  end

  get '/games/edit/:id' do 
    if logged_in? 
      @game = Game.find_by(:id => params[:id])
      erb :'/games/update'
    else  
      redirect to '/user/login'
    end
  end
  
  patch '/games/edit/:id' do 
    @game = Game.find_by(:id => params[:id])

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

    @user = User.find(session[:user_id])
    redirect to "/user/#{@user.id}"
  end
  
end
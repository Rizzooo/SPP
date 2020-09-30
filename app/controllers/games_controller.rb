class GamesController < ApplicationController
  get '/games/new' do
    redirect_if_not_logged_in
      
    erb :'/games/new'
  end

  post '/games/new_game' do 
      @game = Game.new(params)
      user = User.find(session[:user_id])

      @game.user_id = user.id
      @game.save
      redirect to "/games/#{@game.id}"
  end
  
  get '/games/:id' do 
    redirect_if_not_logged_in

    @game = Game.find_by(:id => params[:id])
    @user = User.find(session[:user_id])
    erb :'/games/display'
  end

  get '/games/edit/:id' do 
    redirect_if_not_logged_in

  
    @game = Game.find_by(:id => params[:id])

    if @game.user_id == session[:user_id]
      erb :'/games/update'
    else  
      erb :'/sessions/temp_error'
    end
  end
  
  patch '/games/edit/:id' do 
    @game = Game.find_by(:id => params[:id])

    if @game.user_id == session[:user_id]
      @game.title = params[:title]
      @game.genre = params[:genre] 
      @game.rating = params[:rating] 
      @game.release_year = params[:release_year] 
      @game.save

    redirect to "/games/#{@game.id}"
    else  
      erb :'/sessions/temp_error'
    end

  end

  delete '/games/:id' do 
    @game = Game.find_by(:id => params[:id])

    if @game.user_id == session[:user_id]
      @game.destroy

      @user = User.find(session[:user_id])
      redirect to "/user/#{@user.id}"
    else  
      erb :'/sessions/temp_error'
    end
  end
  
end
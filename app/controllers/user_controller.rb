class UserController < ApplicationController
  
  get '/user/signup' do 
    erb :'/sessions/signup'
  end

  post '/user/signup' do
    
    @user = User.new(:username => params[:username], :password => params[:password])
      # binding.pry
    if @user.save 
      session[:user_id] = @user.id
      redirect to "/user/#{@user.id}"
    else
      redirect to "/user/signup"
    end
  end

  get '/user/login' do 
    erb :'sessions/login.html'
  end
  
  get '/user/:id' do 
    redirect_if_not_logged_in
    # binding.pry
    @user = User.find(session[:user_id])
    @games = []
    # binding.pry
    Game.all.each do |g|
      if g.user_id == @user.id
        @games << g 
      end
    end
    erb :'/games/homepage'
  end

  get '/user/edit/:id' do
    redirect_if_not_logged_in

    @user = User.find(session[:user_id])
    erb :'/users/update'
  end
  
  patch '/user/edit/:id' do
    @user = User.find(session[:user_id])
    @user.username = params[:username]
    @user.save

    redirect to "/user/#{@user.id}"
  end

  delete '/user/:id' do 
    user = User.find(session[:user_id])
    user.destroy

    redirect to "/home"
  end

  get '/user/:id/logout' do
    session.destroy
    redirect to "/home"
  end
end
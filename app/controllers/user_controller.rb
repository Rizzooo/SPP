class UserController < ApplicationController
  
  post '/user/signup' do
    @user = User.new(:username => params[:username], :password => params[:password])
    # login(params[:username], params[:password])

    if @user.save
      redirect to "/user/#{@user.id}"
    else
      erb :'/sessions/temp_error'
    end
  end
  
  get '/user/:id' do 
    if logged_in?
      @user = User.find_by(:username => session[:username])
      @games = []

      # binding.pry
      
      Game.all.each do |g|
        if g.user_id == @user.id
          @games << g 
        end
      end

      # binding.pry

      erb :'/games/homepage'
    else
      redirect to '/home'
    end
  end

  get '/user/homepage' do 
    @user = User.find_by(:username => session[:username])
    @games = Game.all.find_by(:user_id => @user.id)

    # binding.pry

    erb :'/games/homepage'
  end
  
  get '/user/edit/:id' do
    @user = User.find_by(:username => session[:username])
    erb :'/users/update'
  end
  
  patch '/user/edit/:id' do
    @user = User.find_by(:id => params[:id])
    @user.username = params[:username]
    @user.save

    redirect to "/user/#{@user.id}"
  end

  delete '/user/:id' do 
    User.find_by(:username => session[:username]).destroy

    redirect to "/home"
  end
end
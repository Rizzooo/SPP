class UserController < ApplicationController
  
  post '/user/signup' do
    @user = User.create(params)

    if @user.save 
      redirect to "/user/#{@user.id}"
    else
      erb :'/sessions/temp_error'
    end
  end
  
  get '/user/:id' do 
    if logged_in?
      @user = User.find_by(:id => params[:id])
      # @user.username = params[:username]
      @games = []
      
      Game.all.each do |g|
        if g.user_id = @user.id
          @games << g 
        end
      end

      # binding.pry

      erb :'/games/homepage'
    else
      redirect to '/home'
    end
  end
  
  get '/user/edit/:id' do
    @user = User.find_by(:id => params[:id])
    erb :'/users/update'
  end
  
  patch '/user/edit/:id' do
    @user = User.find_by(:id => params[:id])
    @user.username = params[:username]
    @user.save
    redirect to "/user/#{@user.id}"
  end

  delete '/user/:id' do 
    @user = User.find_by(params[:username])
    @user.delete

    redirect to "/home"
  end
end
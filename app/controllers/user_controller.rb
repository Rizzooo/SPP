class UserController < ApplicationController
  
  # get '/user' do
  #   if 
      
  #   else
      
  #   end
  # end
  
  get '/user/:id' do 
    @user = User.find_by(params[:id])
    erb :'/games/homepage'
  end
  
  get '/user/edit/:id' do
    @user = User.find_by(params[:id])
    erb :'/users/update'
  end
  
  patch '/user/edit/:id' do
  
    redirect to '/user/:id'
  end
end
class GamesController < Sinatra::Base
  
  get '/games' do 
    if session[:username].empty?
      redirect "/login"
    else 
      @user = User.new(session[:username])
      
      erb :homepage
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
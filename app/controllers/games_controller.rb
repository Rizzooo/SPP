class GamesController < Sinatra::Base
  
  get '/games' do 
    if session[:username].empty?
      redirect "/login"
    else 
      erb :homepage
    end
  end
  
  get '/games/new' do
    erb :new
  end
  
  post '/games/:id' do 
    @game = Game(params)
    
    erb :display
  end
  
end
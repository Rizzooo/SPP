class GamesController < Sinatra::Base
  
  get '/games' do 
    "You are logged in as #{session[:username]}."
  end
  
end
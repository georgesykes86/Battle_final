require 'sinatra/base'
require './lib/player'
require './lib/game'
require './lib/ai'

class UBM < Sinatra::Base
  enable :sessions

  before do
    @game = Game.game
  end

  get '/' do
    erb :mode
  end

  post '/single' do
    redirect '/name'
  end

  post '/double' do
    redirect '/names'
  end

  get '/names' do
    erb :names
  end

  get '/name' do
    erb :name
  end

  post '/names' do
    if params[:player2] == "X89Fgst73hqu4a"
      Game.start_game(Player.new(params[:player1]), AI.new)
    else
      Game.start_game(Player.new(params[:player1]), Player.new(params[:player2]))
    end
    redirect '/play'
    sleep 20
  end

  get '/play' do
    erb :play
  end

  post '/attack' do
    attack
    redirect '/play'
  end

  def attack
    @game.attack
  end

end

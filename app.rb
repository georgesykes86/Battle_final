require 'sinatra/base'
require './lib/player'
require './lib/game'

class UBM < Sinatra::Base
  enable :sessions

  before do
    @game = Game.game
  end

  get '/' do
    erb(:index)
  end

  post '/names' do
    Game.start_game(Player.new(params[:player1]), Player.new(params[:player2]))
    redirect '/play'
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

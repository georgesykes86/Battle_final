class Game
  attr_reader :player1, :player2, :attack_message

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @players = [@player1, @player2]
  end

  def self.game
    @game
  end

  def self.start_game(player1, player2)
    @game = self.new(player1, player2)
  end

  def attack
    other_player.hurt
    set_attack_message
    end_turn
  end

  def current_player
    @players.first
  end

  def other_player
    @players.last
  end

  def end_turn
    @players.rotate!
  end

  def over?
    @player1.health == 0 || @player2.health == 0
  end

  def loser
    @players.select { |player| player.health = 0 }
  end

  private

  def set_attack_message
    @attack_message = "POW! #{other_player.name} has been slapped!"
  end

end

require 'game'

describe Game, :game do
  let(:game) { described_class.new(player1, player2) }
  let(:player1) { spy :player1 }
  let(:player2) { spy :player2 }

  it 'Defines current player upon instantiation' do
    expect(game.current_player).to be(player1)
  end

  it 'Defines other player upon instantiation' do
    expect(game.other_player).to be(player2)
  end

  describe '#attack' do
    it 'Creates an attack on player 2' do
      game.attack
      expect(game.player2).to have_received(:hurt)
    end
  end

  describe '#end_turn' do
    it 'Swaps value of current and other player' do
      game.attack
      expect(game.current_player).to be(player2)
    end
  end

  describe '#over?' do
    it 'returns true when a player reaches zero' do
      allow(player1).to receive(:health).and_return(0)
      allow(player2).to receive(:health).and_return(10)
      expect(game.over?).to be true
    end

    it 'returns false when no player has reached zero' do
      allow(player1).to receive(:health).and_return(10)
      allow(player2).to receive(:health).and_return(10)
      expect(game.over?).to be false
    end
  end

  describe '#self.set_game and self.game' do
    it 'returns the game' do
      described_class.start_game(player1, player2)
      expect(described_class.game.player1).to be player1
      expect(described_class.game.player2).to be player2
    end
  end
end

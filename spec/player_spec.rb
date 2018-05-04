require 'player'

describe Player, :player do
  let(:subject) { described_class.new(name) }
  let(:name) { 'Bob' }

  describe '#name' do
    it 'Returns the player name' do
    expect(subject.name).to eq 'Bob'
    end
  end

  describe '#health' do
    it 'Returns the players health' do
      expect(subject.health).to eq 100
    end
  end

  describe '#hurt' do
    it 'reduces health' do
      srand(2)
      expect { subject.hurt }.to change{subject.health}.by (-rand(described_class::HURT_POINTS)-1)
    end
  end
end

class Player
  attr_reader :name, :health
  HEALTH = 100
  HURT_POINTS = 10

  def initialize(name, health = HEALTH)
    @name = name
    @health = health
  end

  def hurt
    @health -= HURT_POINTS
  end
end

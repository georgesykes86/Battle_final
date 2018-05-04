class Player
  attr_reader :name, :health
  HEALTH = 100
  HURT_POINTS = 25

  def initialize(name, health = HEALTH)
    @name = name
    @health = health
  end

  def hurt
    @health -= rand(HURT_POINTS) + 1
  end
end

class Player
  attr_reader :name, :health
  HEALTH = 100
  HURT_POINTS = 10

  def initialize(name, health = HEALTH)
    @name = name
    @health = health
  end

  def hurt
    srand(2)
    @health -= rand(HURT_POINTS) + 1
  end
end

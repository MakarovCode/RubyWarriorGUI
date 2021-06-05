class Player
  def play_turn(warrior)

     if @health.nil?
      @health = 0
    else
      @health += 1
    end
    if @health < 2
      warrior.pivot!
    else
      warrior.walk!
    end
    
  end
end

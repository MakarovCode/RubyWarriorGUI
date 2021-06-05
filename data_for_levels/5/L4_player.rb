class Player
  def play_turn(warrior)
    if warrior.feel.enemy?
      warrior.attack!
    else
      if warrior.health < 12
        if warrior.health >= @health
        	warrior.rest!
        else
          warrior.attack!
        end
      else
        warrior.walk!
      end
    end
    @health = warrior.health
  end
end

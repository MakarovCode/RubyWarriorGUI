class Player
  def play_turn(warrior)
    if warrior.feel.wall?
    	warrior.pivot!
    else
      	if warrior.feel.empty?
          warrior.walk!
    	else
      		warrior.shoot!
    	end
    end
  end
end

class Player
  def play_turn(warrior)
    # add your code here
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

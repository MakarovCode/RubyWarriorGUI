class Player
  def play_turn(warrior)
    if warrior.feel.captive?
      warrior.rescue!
    else
      warrior.walk!
    end
  end
end

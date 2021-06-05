class RubywarriorTowerWarrior < ApplicationRecord
  
  def get_direction 
    if direction == 0
      "north"
    elsif direction == 1
      "east"
    elsif direction == 2
      "south"
    else
      "west"
    end
  end
  
end

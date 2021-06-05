class RubywarriorPlayer < ApplicationRecord
  
  has_many :rubywarrior_player_towers
  belongs_to :user
  
  def levels
    rubywarrior_player_towers
  end
  
  def data_for_level(level)
    rubywarrior_player_towers.where(rubywarrior_tower_id: level).first
  end
  
  def epic?
    true
  end
  
  def level_after_epic?
    false
  end
  
end

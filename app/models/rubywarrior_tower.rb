class RubywarriorTower < ApplicationRecord
  belongs_to :rubywarrior_tower_warrior
  has_many :rubywarrior_tower_units
  
  def units 
    rubywarrior_tower_units
  end
  
  def warrior
    rubywarrior_tower_warrior
  end
  
end

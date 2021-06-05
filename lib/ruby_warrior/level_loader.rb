module RubyWarrior
  class LevelLoader
    def initialize(level, tower)
      @floor = RubyWarrior::Floor.new
      #puts "=====>LEVEL LOADER, #{@floor.to_json}"
      @level = level
      
      description tower.description
      tip tower.tip
      clue tower.clue
      time_bonus tower.time_bonus
      ace_score tower.ace_score
      size tower.size_width, tower.size_height
      stairs tower.stairs_x, tower.stairs_y
      
      warrior tower.warrior.pos_x, tower.warrior.pos_y, :"#{tower.warrior.get_direction}", 0 do |u|
        tower.warrior.habilities.split(",").each do |ab|
          u.add_abilities :"#{ab}"
        end
      end
      
      tower.units.each do |u|
        unit :"#{u.name}", u.pos_x, u.pos_y, :"#{u.get_direction}", u.id
      end
      
      @level.floor = @floor
    end
    
    def description(desc)
      @level.description = desc
    end
    
    def tip(tip)
      @level.tip = tip
    end
    
    def clue(clue)
      @level.clue = clue
    end
    
    def time_bonus(bonus)
      @level.time_bonus = bonus
    end
    
    def ace_score(score)
      @level.ace_score = score
    end
    
    def size(width, height)
      @floor.width = width
      @floor.height = height
    end
    
    def stairs(x, y)
      @floor.place_stairs(x, y)
    end
    
    def unit(unit, x, y, facing = :north, uid)
      unit = unit_to_constant(unit).new unless unit.kind_of? Units::Base
      @floor.add(unit, x, y, facing, uid)
      yield unit if block_given?
      unit
    end
    
    def warrior(*args, &block)
      @level.setup_warrior unit(Units::Warrior.new, *args, &block)
    end
    
    private
    
    def unit_to_constant(name)
      camel = name.to_s.split('_').map { |s| s.capitalize }.join
      eval("Units::#{camel}")
    end
  end
end

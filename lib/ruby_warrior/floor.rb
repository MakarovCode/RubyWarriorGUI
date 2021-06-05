module RubyWarrior
  class Floor
    attr_accessor :width, :height, :grid
    attr_reader :stairs_location
    
    def initialize
      @width = 0
      @height = 0
      @units = []
      @stairs_location = [-1, -1]
    end
    
    def add(unit, x, y, direction = nil, uid)
      @units << unit
      unit.position = Position.new(self, x, y, direction)
      unit.id = uid
    end
    
    def place_stairs(x, y)
      @stairs_location = [x, y]
    end
    
    def stairs_space
      space(*@stairs_location)
    end
    
    def units
      @units.reject { |u| u.position.nil? }
    end
    
    def other_units
      units.reject { |u| u.kind_of? Units::Warrior }
    end
    
    def get(x, y)
      units.detect do |unit|
        unit.position.at?(x, y)
      end
    end
    
    def space(x, y)
      Space.new(self, x, y)
    end
    
    def out_of_bounds?(x, y)
      x < 0 || y < 0 || x > @width-1 || y > @height-1
    end
    
    def character
      rows = []
      rows << " " + ("-" * @width)
      draw = []
      @height.times do |y|
        row = "|"
        draw_inner = []
        @width.times do |x|
          draw_inner.push(space(x, y).character)
          row << space(x, y).character
        end
        row << "|"
        rows << row
        draw.push(draw_inner)
      end
      rows << " " + ("-" * @width)
      rows.join("\n") + "\n"
      draw
    end
    
    def unique_units
      unique_units = []
      units.each do |unit|
        unique_units << unit unless unique_units.map { |u| u.class }.include?(unit.class)
      end
      unique_units
    end
  end
end
